library ieee;
use ieee.std_logic_1164.all;
use work.components.all;

entity dds is
   port(
   i_rst: in std_logic;
   i_clk: in std_logic;
   i_df: in std_logic_vector(15 downto 0);
   o_wave: out std_logic_vector(7 downto 0));
end entity;

architecture behave of dds is

   signal s_rst_sync: std_logic;
   signal s_addr: std_logic_vector(9 downto 0);
   signal s_rom_data: std_logic_vector(7 downto 0);

begin

   rst: rst_sync port map(
   i_rst => i_rst,
   i_clk => i_clk,
   o_rst_sync => s_rst_sync);

   acc: phase_acc port map(
   i_rst => s_rst_sync,
   i_clk => i_clk,
   i_df => i_df,
   o_addr => s_addr);

   mem: rom port map(
   i_addr => s_addr,   
   o_data => s_rom_data);

   outreg: reg generic map (8) port map(
   i_rst => s_rst_sync,
   i_clk => i_clk,
   i_en => '1',
   i_data => s_rom_data,
   o_data => o_wave);

end architecture;