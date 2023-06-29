--Tri state
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ARITH;
use IEEE.STD_LOGIC_1164.UNSIGNED;


entity tri_est is
    Port ( clk : in STD_LOGIC;
           cs : in STD_LOGIC_VECTOR (4 downto 0);
           operacion : in STD_LOGIC_VECTOR (3 downto 0);
           dataout : inout STD_LOGIC_VECTOR (3 downto 0));
end tri_est;

architecture Behavioral of tri_est is
begin
    process(clk, cs)
    begin
        if (clk' event and clk = '1') then
            case cs is
                when "11000" => dataout <= operacion;
                when others => dataout <="ZZZZ";--Valor de alta impedancia
            end case;
        end if;
    
    end process;
end Behavioral;
