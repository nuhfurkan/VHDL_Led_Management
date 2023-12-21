library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LED_Controller is
  Port ( CLK         : in  std_logic;
         LDR_Signal  : in  std_logic;
         LED_Output  : out std_logic);
end LED_Controller;

architecture Behavioral of LED_Controller is
  signal timer : integer := 0;
  signal led_on : std_logic := '0';
begin
  p1: process(CLK)
  begin
    if rising_edge(CLK) then
      if LDR_Signal = '0' then -- No light detected 
        if timer < 10000000 then  -- turn on LED for 10 seconds (10 million steps)
          LED_Output <= '1';
          timer <= timer + 1;
        else
          LED_Output <= '0';
          timer <= 0;
        end if;
      else -- Light detected - turn off LED
        LED_Output <= '0';
        timer <= 0;
      end if;
    end if;
  end process;

end Behavioral;
