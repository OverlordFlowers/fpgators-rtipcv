library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;
use work.test_pkg.all;




entity top is
  port (
    test_in     :       in std_logic;
    test_out    :       out std_logic
  ) ;
end top ; 

architecture top_arch of top is
    signal testss :   num_array(8 downto 0)(31 downto 0);
begin
    inst_of_conv2d : entity work.conv2d(bad_impl) port map (
        im_in => testss,
        kernel_in => testss,
        
      
        result => open
    );
end architecture ;