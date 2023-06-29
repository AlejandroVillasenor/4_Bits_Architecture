--VMA Validation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ARITH;
use IEEE.STD_LOGIC_1164.UNSIGNED;


entity dir_val is
    Port ( cs : in STD_LOGIC_VECTOR (4 downto 0);
           vma : out STD_LOGIC);
end dir_val;
architecture Behavioral of dir_val is
begin
    process(cs)
    begin
        vma <= (not (cs(3)) and cs(2) and cs(1) and not(cs(0))) or (cs(3) and not(cs(2)) and not(cs(1)) and not(cs(0)));
    end process;
end Behavioral;
