--Sumador Restador de 4 bits

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity SumadorRestador is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           BI : in STD_LOGIC_VECTOR (3 downto 0);
           OP: in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Co : out STD_LOGIC);
end SumadorRestador;

architecture Behavioral of SumadorRestador is 
--Seniales internas
signal C: STD_LOGIC_VECTOR (2 downto 0);
signal B : STD_LOGIC_VECTOR (3 downto 0);
begin
    B(0)<=BI(0) xor OP;
    B(1)<=BI(1) xor OP;
    B(2)<=BI(2) xor OP;
    B(3)<=BI(3) xor OP;
    
    S(0)<=a(0) xor b(0) xor OP;
    C(0)<=(a(0) and b(0)) or (OP and (a(0) xor b(0)));
    S(1)<=a(1) xor b(1) xor C(0);
    C(1)<=(a(1) and b(1)) or (C(0) and (a(1) xor b(1)));
    S(2)<=a(2) xor b(2) xor C(1);
    C(2)<=(a(2) and b(2)) or (C(1) and (a(2) xor b(2)));
    S(3)<=a(3) xor b(3) xor C(2);
process(A,BI,OP,B)
begin
    if(OP = '1') then --Validacion si es una resta
        if (A<BI) then
            Co<='1';
        else
            Co<='0';
        end if;
    else
        Co<=((a(3) and b(3)) or (C(2) and (a(3) xor b(3))));
    end if;
end process;
end Behavioral;
