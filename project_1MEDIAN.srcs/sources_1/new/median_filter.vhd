----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2020 05:53:29 PM
-- Design Name: 
-- Module Name: median_filter - Behavioral
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

entity median_filter is
    Generic ( width: natural := 4;
              height: natural := 4);
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           rst : in STD_LOGIC;
           pixels : inout LOGIC_VECTOR_ARRAY ((width * height)-1 downto 0));
end median_filter;

architecture Structural of median_filter is

--sorter
component sorter is
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           rst : in STD_LOGIC;
           P_in : in LOGIC_VECTOR_ARRAY (8 downto 0);
           P_out : out STD_LOGIC_VECTOR (7 downto 0));
end component sorter;

begin

sorters: for i in 1 to width-2 * height-2 generate
    add: sorter
    port map (clk => clk,
              en => en,
              rst => rst,
              P_in => pixels(i*8 downto (i-1)*8),
              P_out => pixels(((i-1)*8)+4));
end generate sorters;

end Structural;