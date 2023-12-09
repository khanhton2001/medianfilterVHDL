----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/01/2020 10:30:10 PM
-- Design Name: 
-- Module Name: sorter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use work.type_def.ALL;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sorter is
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           rst : in STD_LOGIC;
           P_in : in LOGIC_VECTOR_ARRAY (8 downto 0);
           P_out : out STD_LOGIC_VECTOR (7 downto 0));
end sorter;

architecture Behavioral of sorter is

begin

sort: process(clk)

variable P_sort: LOGIC_VECTOR_ARRAY (8 downto 0);
variable temp: std_logic_vector (7 downto 0);

begin

    if (rising_edge(clk)) then
        if (rst = '1') then
            P_out <= (others => '0');
        elsif (en = '1') then
            P_sort := P_in;
            for i in 8 downto 0 loop
                for j in 0 to i-1 loop
                    if (P_sort(j) < P_sort(j+1)) then
                        temp := P_sort(j);
                        P_sort(j) := P_sort(j + 1);
                        P_sort(j + 1) := temp;
                    end if;
                end loop;
            end loop;
            P_out <= P_sort(4);
        end if;
    end if;
    
end process sort;

end Behavioral;