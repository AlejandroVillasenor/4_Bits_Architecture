--Control register
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity control is
 Port ( 
    reset: in STD_LOGIC;
    clk: in STD_LOGIC;
    irq: in STD_LOGIC_VECTOR (1 downto 0);
    rw: inout STD_LOGIC;
    datain: in STD_LOGIC_VECTOR (3 downto 0);
    pcontrol: inout STD_LOGIC_VECTOR (7 downto 0);
    rc:  in STD_LOGIC_VECTOR (3 downto 0);
    pcout: in STD_LOGIC_VECTOR (7 downto 0);
    cs: inout STD_LOGIC_VECTOR (4 downto 0));
end control;

architecture Behavioral of control is
type estados is (d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17);
signal edo_presente, edo_futuro:estados; 
signal f:  std_logic_vector  (7 downto 0);
begin
procesoA: process(edo_presente, irq, reset)
begin
    if reset='1' then
        edo_futuro<=d0;
        pcontrol<="11111111";
        rw<='0';
        cs<="11110"; 
    else
        case edo_presente is 
            when d0 =>
                if irq="10" then 
                    cs<="11100";
                    edo_futuro<=d1;
                elsif irq="01" then
                    cs<="11100";
                    edo_futuro<=d1;
                else
                    cs<="11111";
                    edo_futuro<=d3;
                end if;
            when d1 =>
                if irq="10" then 
                    pcontrol<="01000000"; 
                    edo_futuro<=d1;
                elsif irq="01" then 
                    pcontrol<="10000000";
                    edo_futuro<=d1;
                else
                    cs<="11110";
                    edo_futuro<=d3;
                end if;
            when d2=>
                cs<=cs;
                edo_futuro<=d5;
            when d3=> 
                cs<="10110";
                rw<='1';
                edo_futuro<=d4;
            when d4=>
                rw<='0';
                if datain="0000" then 
                    cs<="00001";
                    edo_futuro<=d2;
                elsif datain="0001" then 
                    cs<="00010";
                    edo_futuro<=d5;
                elsif datain="0010" then 
                    cs<="00011";
                    edo_futuro<=d5;
                elsif datain="0011" then 
                    cs<="00100";
                    edo_futuro<=d5;
                elsif datain="0100" then 
                    cs<="00101";
                    edo_futuro<=d5;
                elsif datain="0101" then 
                    cs<="00110";
                    edo_futuro<=d5;
                elsif datain="0110" then
                    cs<="11111";
                    edo_futuro<=d6;
                elsif datain="0111" then 
                    cs<="11111";
                    edo_futuro<=d7;
                elsif datain="1000" then
                    cs<="11111";
                    edo_futuro<=d8;
                elsif datain="1001" then
                    cs<="00111";
                    edo_futuro<=d9;
                elsif datain="1010" then
                    cs<="11011";
                    edo_futuro<=d0;
                elsif datain="1011" then
                    cs<="11111";
                    if rc(0)='1'  then
                        edo_futuro<=d10;
                    else
                        edo_futuro<=d0;
                    end if;
                elsif datain="1100" then 
                    cs<="11111";
                    if rc(2)='1'  then 
                        edo_futuro<=d0;
                    end if;
                elsif datain="1101" then 
                    cs<="11111";
                    if rc(1)='1'  then
                        edo_futuro<=d10; 
                    else
                        edo_futuro<=d0; 
                    end if;
                elsif datain="1110" then 
                    cs<="11111";
                    if rc(3)='1'  then
                        edo_futuro<=d10; 
                    else
                        edo_futuro<=d0; 
                    end if;
                end if;
            when d5=>
                cs<="10101";
                edo_futuro<=d11;
            when d6=> 
                cs<="10110";
                rw<='1';
                edo_futuro<=d12;
            when d7=> 
                cs<="10110"; 
                rw<='1';
                edo_futuro<=d11;
            when d8=> 
                cs<="10110"; 
                rw<='1';
                edo_futuro<=d15;
            when d9=>
                cs<="11000";
                edo_futuro<=d10;
            when d10=> 
                cs<="10110"; 
                rw<='1';
                edo_futuro<=d16;
            when d11=> 
                cs<="10001";
                rw<='0';
                edo_futuro<=d0;
            when d12=> 
                cs<="11111"; 
                rw<='0';
                pcontrol(0)<=datain(0); 
                pcontrol(1)<=datain(1); 
                pcontrol(2)<=datain(2); 
                pcontrol(3)<=datain(3); 
                pcontrol(4)<=pcontrol(4); 
                pcontrol(5)<=pcontrol(5); 
                pcontrol(6)<=pcontrol(6);
                pcontrol(7)<=pcontrol(7); 
                edo_futuro<=d13;
            when d13=>
                cs<= "10110" ;
                rw<='1';
                edo_futuro<=d14;
            when d14=> 
                cs<="11010"; 
                rw<='0';
                pcontrol(0)<=pcontrol(0); 
                pcontrol(1)<=pcontrol(1); 
                pcontrol(2)<=pcontrol(2); 
                pcontrol(3)<=pcontrol(3); 
                pcontrol(4)<=datain(0); 
                pcontrol(5)<=datain(1); 
                pcontrol(6)<=datain(2); 
                pcontrol(7)<=datain(3); 
                edo_futuro<=d0;
            when d15=> 
                cs<="10010"; 
                rw<='0';
                edo_futuro<=d0;
            when d16=> 
                cs<="10000"; 
                f(0)<=datain(0);
                f(1)<=datain(1);
                f(2)<=datain(2); 
                f(3)<='0';
                f(4)<='0'; 
                f(5)<='0'; 
                f(6)<='0';
                f(7)<='0';
                if datain(3)='0'  then 
                    pcontrol<=pcout+f;
                    edo_futuro<=d17; 
                else
                    pcontrol<=pcout-f;
                    edo_futuro<=d17; 
                end if;
            when d17=>
                cs<="11110";
                edo_futuro<=d0;
        end case;
    end if;
end process procesoA;

procesoB:  process(clk,reset)
begin
    if(clk'  event and clk='1')  then 
        if reset='0'  then
            edo_presente<=edo_futuro; 
        else
            null; 
        end if;
    end if;
end process procesoB;
end Behavioral;
