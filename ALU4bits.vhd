library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity ALU4bits is
    Port ( CLK : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           CS : in STD_LOGIC_VECTOR (4 downto 0);
           operacion : inout STD_LOGIC_VECTOR (3 downto 0);
           rc : inout STD_LOGIC_VECTOR (3 downto 0));
end ALU4bits;

architecture Behavioral of ALU4bits is
signal C1:std_logic_vector (1 downto 0);
begin
process(CLK)
variable Cout: std_logic;
begin
    if(CLK' event and CLK='1') then 
        case CS is
            when "00000" => operacion <=(A+B);
                C1(0)<=(A(1) and B(1)) or ((A(0) and B(0)) and (A(1) xor B(1)));
                C1(1)<=(A(2) and B(2)) or (C1(0) and (A(2) xor B(2)));
                Cout:=(A(3) and B(3)) or (C1(1) and (A(3) xor B(3)));
            when "00001" => operacion <=(A-B);
                if (A>=B) then 
                    Cout:='0';
                    C1(0)<='0';
                else 
                    Cout:='1';
                    C1(0)<='1';
                end if;
            when "00010" => operacion <=(A and B);
                Cout:='0';
                C1(0)<='0';
            when "00011" => operacion <=(A or B);
                Cout:='0';
                C1(0)<='0';
            when "00100" => operacion <=(not A);
                Cout:='0';
                C1(0)<='0';
            when "00101" => operacion <=(A xor B);
                Cout:='0';
                C1(0)<='0';
            when "00110" => operacion <=(A and "1111");
                Cout:=Cout;
                C1(0)<=C1(0);
            when others => null;
        end case;        
    end if;
    rc(0)<= Cout;--Acarreo
    rc(1)<= Cout;--Signo 
    rc(2)<= not (operacion(3) or operacion(2) or operacion(1) or operacion(0));
    rc(3)<= Cout xor C1(0);--Sobreflujo
end process;
end Behavioral;
