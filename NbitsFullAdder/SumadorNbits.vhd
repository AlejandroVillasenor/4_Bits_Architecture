--Sumador Nbits
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SumadorNbits is
--Constante entera
generic(nbits: integer:=8);
    Port ( A : in STD_LOGIC_VECTOR (nbits-1 downto 0);
           B : in STD_LOGIC_VECTOR (nbits-1 downto 0);
           Ci : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (nbits-1 downto 0);
           Cout : out STD_LOGIC);
end SumadorNbits;

architecture Behavioral of SumadorNbits is
component fullAdder
    port(A,B,Ci: in STD_LOGIC;
        S, Co: out STD_LOGIC);
end component;
-- Senal auxiliar para la propagacion de acarreos
signal Ct: STD_LOGIC_VECTOR(nbits downto 0);
begin
--Inicializa acarreo temporal
Ct(0)<=Ci;
--Se genera el conjunto de sumadores completos
GeneraFA: for i in 0 to nbits-1 generate
FA: fullAdder port map(A=>A(i),B=>B(i),Ci=>Ct(i),S=>S(i),Co=>Ct(i+1));
end generate;
Cout<=Ct(nbits-1);
end Behavioral;
