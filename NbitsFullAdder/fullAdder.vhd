--Full Adder
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fullAdder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Ci : in STD_LOGIC;
           S : out STD_LOGIC;
           Co : out STD_LOGIC);
end fullAdder;

architecture Behavioral of fullAdder is

begin
S<= A XOR B XOR Ci;
Co<= (A AND B) OR (Ci AND (A XOR B)); 

end Behavioral;
