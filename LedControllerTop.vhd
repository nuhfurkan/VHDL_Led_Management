library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LED_Controller_Top is
end LED_Controller_Top;

architecture Behavioral of LED_Controller_Top is
  signal CLK       : std_logic := '0';
  signal LDR_Signal: std_logic := '0';
  signal LED_Output: std_logic;

  component LED_Controller
    Port ( CLK         : in  std_logic;
           LDR_Signal  : in  std_logic;
           LED_Output  : out std_logic);
  end component;

begin
  LED_Controller_inst : LED_Controller
    port map (
      CLK => CLK, 
      LDR_Signal => LDR_Signal, 
      LED_Output => LED_Output
      );

  process
  begin
    wait for 500 ms;
    CLK <= not CLK;
  end process;

end Behavioral;
