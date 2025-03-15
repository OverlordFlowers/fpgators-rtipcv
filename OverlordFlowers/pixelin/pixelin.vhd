library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity pixelin is
  port (
    rst         :   in std_logic;

    href        :   in std_logic;
    pclk        :   in std_logic;
    byte_stream :   in std_logic_vector(7 downto 0);

    valid_out   :   out std_logic;
    pout        :   out std_logic_vector(7 downto 0);
    err         :   out std_logic; -- error flag if given unexpected format
  ) ;
end pixelin ; 

architecture rgb565 of pixelin is
    type state_type is (err, first, second);

    signal current_state : state_type := first;

    signal rgb565        : std_logic_vector(15 downto 0);

begin
    -- expects 4 bits to be empty on 1st cloc
    process(pclk, rst) begin
        if (rst = '1') then
            current_state <= first;
        elsif (rising_edge(pclk)) then
            case current_state is
                when first:
                    if (href) then
                        rgb565(15 downto 11) <= byte_stream(7 downto 3);
                        rgb565(10 downto 8) <= byte_stream(2 downto 0);
                        current_state <= second;
                    end if;
                when second:
                    if (href) then
                        rgb565(7 downto 5) <= byte_stream(7 downto 5);
                        rgb565(4 downto 0) <= byte_stream(4 downto 0);
                        current_state <= first;
                    end if;

                when err:
                when others =>
                    err <= '1'
            end case
        end if
    end process;
    
end architecture ;