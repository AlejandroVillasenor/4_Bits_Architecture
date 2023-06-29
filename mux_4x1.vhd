--4x1 multiplexere
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_4x1 is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           c : in STD_LOGIC_VECTOR (7 downto 0);
           d : in STD_LOGIC_VECTOR (7 downto 0);
           s : in STD_LOGIC_VECTOR (1 downto 0);
           f : out STD_LOGIC_VECTOR (7 downto 0));
end mux_4x1;

architecture Behavioral of mux_4x1 is
--inicio behavioral
begin  
process(a,b,c,d,s)
begin

    if s="00" then
        f<=a;
    elsif s="01" then
        f<=b;
    elsif s="10" then
        f<=c;
    else
        f<=d;
    end if;
end process;
end  Behavioral;
