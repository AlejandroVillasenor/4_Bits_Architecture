--FULL ADDER
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Sumador is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           Ci : in STD_LOGIC;
           S : out STD_LOGIC;
           Co : out STD_LOGIC);
end Sumador;

architecture FullAdder of Sumador is

begin
S<= a xor b xor Ci;
Co<= (a and b) or (Ci and (a xor b));

end FullAdder;
