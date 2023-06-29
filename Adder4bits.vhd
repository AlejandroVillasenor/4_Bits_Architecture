--Adder4Bits
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder4bits is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Ci:in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Co : out STD_LOGIC);
end Adder4bits;

architecture Behavioral of Adder4bits is
--Seniales internas
signal C: STD_LOGIC_VECTOR (2 downto 0);
begin
S(0)<=a(0) xor b(0) xor Ci;
C(0)<=(a(0) and b(0)) or (Ci and (a(0) xor b(0)));
S(1)<=a(1) xor b(1) xor C(0);
C(1)<=(a(1) and b(1)) or (C(0) and (a(1) xor b(1)));
S(2)<=a(2) xor b(2) xor C(1);
C(2)<=(a(2) and b(2)) or (C(1) and (a(2) xor b(2)));
S(3)<=a(3) xor b(3) xor C(2);
Co<=(a(3) and b(3)) or (C(2) and (a(3) xor b(3)));

end Behavioral;
