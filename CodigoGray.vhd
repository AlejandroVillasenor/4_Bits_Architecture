--GRAY COUNTER

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity CodigoGray is
    Port ( CLK : in STD_LOGIC;
           RST, D : in STD_LOGIC;
           Q : inout STD_LOGIC_VECTOR (3 downto 0);
           F : out STD_LOGIC_VECTOR (3 downto 0));
end CodigoGray;

architecture Behavioral of CodigoGray is
begin
--INICIO DEL PROCESO QUE REALIZA EL CONTEO
contador:process(Q, CLK, RST, D)--Sensible a las entradas(senales) que recibe para hacer una reaccion
begin
    if RST ='0' then --Se resetea el contador
        Q<="0000";
    else
        if (CLK' event and CLK='0') then
            if (D ='0') then--DOWN
                if (Q="0000") then
                    Q<="1111";
                else 
                    Q<=Q-1;
                end if;
            else--UP
                if (Q="1111") then
                    Q<="0000";
                else
                    Q<=Q+1;
                end if;
            end if;
        end if; 
    end if;
end process contador;
--
deco:process(Q)
begin
    case Q is
        when "0000"=>F <="0000";
        when "0001"=>F <="0001";
        when "0010"=>F <="0011";
        when "0011"=>F <="0010";
        when "0100"=>F <="0110";
        when "0101"=>F <="0111";
        when "0110"=>F <="0101";
        when "0111"=>F <="0100";
        when "1000"=>F <="1100";
        when "1001"=>F <="1101";
        when "1010"=>F <="1111";
        when "1011" =>F <="1110";
        when "1100"=>F <="1010";
        when "1101"=>F <="1011";
        when "1110"=>F <="1001";
        when "1111"=>F <="1000";
    end case; 
end process deco;

end Behavioral;
