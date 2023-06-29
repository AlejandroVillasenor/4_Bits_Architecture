--Sel Dir register
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ARITH;
use IEEE.STD_LOGIC_1164.UNSIGNED;

entity sel_dir is
    Port ( clk : in STD_LOGIC;
           pcout : in STD_LOGIC_VECTOR (7 downto 0);
           ix : in STD_LOGIC_VECTOR (7 downto 0);
           cs : in STD_LOGIC_VECTOR (4 downto 0);
           direccion : out STD_LOGIC_VECTOR (7 downto 0));
end sel_dir;

architecture Behavioral of sel_dir is

begin
process(clk, cs)
begin
    if (clk' event and clk = '1') then
        case cs is
            when "11000" => direccion <= ix;
            when others => direccion <=pcout;
        end case;
    end if;

end process;


end Behavioral;
