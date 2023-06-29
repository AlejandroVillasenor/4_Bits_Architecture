--4 bits Multiplexer

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Multiplexor is
    Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           E0 : in STD_LOGIC;
           E1 : in STD_LOGIC;
           E2 : in STD_LOGIC;
           E3 : in STD_LOGIC;
           F : out STD_LOGIC);
end Multiplexor;
architecture Behavioral of Multiplexor is

begin
F <= ((NOT S0) AND (NOT S1) AND E0) OR ((NOT S0) AND S1 AND E1) OR (S0 AND (NOT S1) AND E2) OR (S0 AND S1 AND E3); 

end Behavioral;
