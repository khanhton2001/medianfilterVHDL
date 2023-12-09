----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2020 07:01:21 PM
-- Design Name: 
-- Module Name: median_filter_tb - Behavioral
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

entity median_filter_tb is
end median_filter_tb;

architecture Behavioral of median_filter_tb is

component median_filter
      Generic ( width: natural := 4;
                height: natural := 4);
      Port ( clk : in STD_LOGIC;
             en : in STD_LOGIC;
             rst : in STD_LOGIC;
             pixels : inout LOGIC_VECTOR_ARRAY ((width * height)-1 downto 0));
  end component;

  signal clk: STD_LOGIC;
  signal en: STD_LOGIC;
  signal rst: STD_LOGIC;
  signal pixels: LOGIC_VECTOR_ARRAY ((4 * 4)-1 downto 0);

begin

  -- Insert values for generic parameters !!
  uut: median_filter generic map ( width  => 4,
                                   height =>  4)
                        port map ( clk    => clk,
                                   en     => en,
                                   rst    => rst,
                                   pixels => pixels );

  stimulus: process
  begin
  
    -- Put initialisation code here


    en <= '1';
    rst <= '0';
    pixels <= (x"12", x"45", x"31", x"f4", 
               x"e2", x"a2", x"a4", x"85", 
               x"b2", x"b8", x"b1", x"c1", 
               x"c5", x"a5", x"93", x"32");

    -- Put test bench stimulus code here

    wait;
  end process;

end Behavioral;