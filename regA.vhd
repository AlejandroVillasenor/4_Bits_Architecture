--A register
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity regA is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           cs : in STD_LOGIC_VECTOR (4 downto 0);
           datoin : in STD_LOGIC_VECTOR (3 downto 0);
           a : inout STD_LOGIC_VECTOR (3 downto 0));
end regA;

architecture Behavioral of regA is
begin
process(clk,cs,reset)
variable ares:STD_LOGIC_VECTOR (3 downto 0);--Cambiar a bres en el otro registro
begin
    if  reset='1' then
        a<="0000";
    else
        if(clk' event and clk = '1') then
            case cs is
                when "10001" => a <=datoin;--Tambien este
                when "11100" => ares:=datoin;--Este se cambia en el b
                when "11101" => a <=ares;
                when others =>null;
            end case;
        end if;
    end if;
end process;
end Behavioral;
