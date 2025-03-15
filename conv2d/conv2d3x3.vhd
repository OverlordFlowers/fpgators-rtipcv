/*
Author: OverlordFlowers
Date Created: 2025_03_14
Date Updated: 2025_03_14
Description: This is more of a proof-of-concept than anything concrete.
I'll make something more generic later. For now, this looks like
it synthesizes correctly.
*/


library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;
use work.test_pkg.all;

entity conv2d is
  port (
    im_in : in num_array(8 downto 0)(31 downto 0);
    kernel_in : in num_array(8 downto 0)(31 downto 0);
    
  
    result : out signed(63 downto 0)
  ) ;
end conv2d ; 

architecture bad_impl of conv2d is
    signal mult_out :   num_array(8 downto 0)(63 downto 0);
begin
    process is
    begin
        for i in 8 downto 0 loop
            mult_out(i) <= im_in(i) * kernel_in(i);
            result <= result + mult_out(i);
        end loop;
        -- fuck it lmao
        -- result <= mult_out(0) + mult_out(1) + mult_out(2) + mult_out(3) + mult_out(4) + mult_out(5) + mult_out(6) + mult_out(7) + mult_out(8);
        
    end process;
end architecture ;