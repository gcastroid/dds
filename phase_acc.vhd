library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity phase_acc is
   port(
   i_rst: in std_logic;
   i_clk: in std_logic;
   i_df: in std_logic_vector(15 downto 0);
   o_addr: out std_logic_vector(9 downto 0));
end entity;

architecture behave of phase_acc is

   signal s_count: unsigned(15 downto 0);

begin

   -- Phase accumulator
   process(i_rst, i_clk)
   begin
      if (i_rst = '0') then
         s_count <= (others => '0');
      elsif (rising_edge(i_clk)) then
         s_count <= s_count + unsigned(i_df);
      end if;
   end process;

   o_addr <= std_logic_vector(s_count(15 downto 6));

end architecture;