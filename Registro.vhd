--PIPO Shift register 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Registro is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           S : in STD_LOGIC_VECTOR (1 downto 0);
           Q : inout STD_LOGIC_VECTOR (3 downto 0);
           D : in STD_LOGIC_VECTOR (3 downto 0));
end Registro;
architecture Behavioral of Registro is
begin
registro:process(CLK,RST,Q,D)
begin
    if RST = '0' then --RESET COUNTER
        Q<="0000";  
    else
        if (CLK' event and CLK='1') then
            case S is
                when "00"=> Q <=Q;--HOLD
                when "01"=>--LEFT SHIFT
                    Q(3 downto 1)<=Q(2 downto 0);
                    Q(0)<=Q(3);
                when "10" => Q <= D;--LOAD
                when "11" =>--RIGHT SHIFT
                    Q(2 downto 0)<=Q(3 downto 1);
                    Q(3)<=Q(0);
            end case;
        end if;
    end if;    
end process registro;
end Behavioral;
