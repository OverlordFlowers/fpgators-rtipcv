/*
Author: OverlordFlowers
Date Created: 2025_03_15
Date Updated: 2025_03_15
Description: This is a buffer to store the image data from the OV7670.
Assuming RGB444; again, this is proof of concept. I'll make something more
generic later.
*/

library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity frame_buffer is
  port (
    bytestreams
  ) ;
end ent ; 

architecture arch of ent is

begin

end architecture ;