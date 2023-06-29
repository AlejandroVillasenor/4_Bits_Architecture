--UP/DOWN GRAY 3 bits Counter

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity grayCounter is
    Port ( CLK : in STD_LOGIC;
           S : in STD_LOGIC;--UP/DOWN SELECTION
           Q : inout STD_LOGIC_VECTOR (2 downto 0));
end grayCounter;

architecture Behavioral of grayCounter is
    signal QN : STD_LOGIC_VECTOR(2 downto 0):="000";
begin
process (CLK,QN)
begin
    if rising_edge(CLK) then
        if S = '0' then --DOWN MODE
            case Q is
                when "000" => QN<= "100"; 
                when "100" => QN <= "101";
                when "101" => QN <= "111";
                when "111" => QN <= "110"; 
                when "110" => QN <= "010";  
                when "010" => QN <= "011";
                when "011" => QN <= "001"; 
                when others => QN <= "000";
            end case;
        else --UP MODE
            case Q is 
                when "000" => QN<= "001"; 
                when "001" => QN <= "011";
                when "011" => QN <= "010";
                when "010" => QN <= "110"; 
                when "110" => QN <= "111";  
                when "111" => QN <= "101";
                when "101" => QN <= "100"; 
                when others => QN <= "000"; 
            end case; 
         end if; Q<=QN;
     end if;
end process;
end Behavioral;
