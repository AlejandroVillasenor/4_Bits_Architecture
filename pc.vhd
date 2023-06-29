--Program Counter
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pc is
    Port ( clk : in STD_LOGIC;
           pcontrol : in STD_LOGIC_VECTOR (7 downto 0);
           cs : in STD_LOGIC_VECTOR (4 downto 0);
           reset : in STD_LOGIC;
           pila : in STD_LOGIC_VECTOR (7 downto 0);
           pcout : inout STD_LOGIC_VECTOR (7 downto 0));
end pc;

architecture Behavioral of pc is
begin
process(clk,cs,reset)
begin
    if reset = '1' then
        pcout<="00000000";
    else
        if(clk' event and clk = '1') then
            case cs is
                when "11110" => pcout <= pcontrol;
                when "11111" => pcout <= pcout + 1;
                when "11101" => pcout <= pila; 
                when others => null;
             end case;
         end if;
    end if;
end process;
end Behavioral;
