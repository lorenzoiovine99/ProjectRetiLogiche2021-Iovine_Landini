--------------------------------------------------------------------------------------------
-- Politecnico Di Milano
-- Lorenzo Iovine, Nicola Landini
-- Matricole: 911740, 909173
-- Codici Persona: 10633107, 10666325
-- Progetto di Reti Logiche AA 2020-2021
--------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity project_reti_logiche is
    port (
        i_clk     : in std_logic;
        i_rst     : in std_logic;
        i_start   : in std_logic;
        i_data    : in std_logic_vector(7 downto 0);
        o_address : out std_logic_vector(15 downto 0);
        o_done    : out std_logic;
        o_en      : out std_logic;
        o_we      : out std_logic;
        o_data    : out std_logic_vector (7 downto 0)
    );
end project_reti_logiche;

architecture Behavioral of project_reti_logiche is
component datapath is
    Port(
        i_clk : in STD_LOGIC;
        i_rst : in STD_LOGIC;
        i_data : in STD_LOGIC_VECTOR (7 downto 0);
        o_address : out STD_LOGIC_VECTOR(15 downto 0);
        o_data : out STD_LOGIC_VECTOR (7 downto 0);
        col_load : in STD_LOGIC;
        row_load : in STD_LOGIC;
        r1_load : in STD_LOGIC;
        max_load : in STD_LOGIC;
        min_load : in STD_LOGIC;
        dim_load : in STD_LOGIC;
        iter_load : in STD_LOGIC;
        iter_end: out STD_LOGIC;
        add_addr : in STD_LOGIC;
        shift_load : in STD_LOGIC;
        delta_load : in STD_LOGIC;
        current_pixel_load : in STD_LOGIC;
        r2_load : in STD_LOGIC;
        ftp_load : in STD_LOGIC;
        npv_load : in STD_LOGIC;
        addr_sel : in STD_LOGIC;
        reset : in STD_LOGIC;
        zero : out STD_LOGIC);
end component;
signal col_load : STD_LOGIC;
signal row_load : STD_LOGIC;
signal dim_load : STD_LOGIC;
signal min_load : STD_LOGIC;
signal max_load : STD_LOGIC;
signal iter_load : STD_LOGIC;
signal delta_load : STD_LOGIC;
signal shift_load : STD_LOGIC;
signal add_addr : STD_LOGIC;
signal iter_end : STD_LOGIC;
signal r1_load : STD_LOGIC;
signal current_pixel_load : STD_LOGIC;
signal r2_load : STD_LOGIC;
signal ftp_load : STD_LOGIC;
signal npv_load : STD_LOGIC;
signal addr_sel : STD_LOGIC;
signal reset : STD_LOGIC;
signal zero : STD_LOGIC;
type S is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18);
signal cur_state, next_state : S;

begin
    DATAPATH0: datapath port map(
        i_clk,
        i_rst,
        i_data,
        o_address,
        o_data,
        col_load,
        row_load,
        r1_load,
        max_load,
        min_load,
        dim_load,
        iter_load,
        iter_end,
        add_addr,
        shift_load,
        delta_load,
        current_pixel_load,
        r2_load,
        ftp_load,
        npv_load,
        addr_sel,
        reset,
        zero
    );
  
  process(i_clk, i_rst)
  begin
    if(i_rst='1') then
        cur_state<=S0;
    elsif rising_edge(i_clk) then
        cur_state<=next_state;
    end if;
  end process;
  
  process(cur_state,i_start,iter_end,zero,i_rst)
  begin
    next_state<=cur_state;
    case cur_state is
        when S0 =>
            if i_start='1' then
                next_state<=S1;
            end if;
        when S1 =>
            if i_rst='1' then
                next_state<=S0;
            elsif i_rst='0' then
                 next_state<=S2;
            end if;
        when S2 =>
            if i_rst='1' then
                next_state<=S0;
            elsif i_rst='0' then
                next_state<=S3;
            end if;
        when S3 =>
            if i_rst='1' then
                next_state<=S0;
            elsif i_rst='0' then
                next_state<=S4;
            end if;
        when S4 =>
            if i_rst='1' then
                next_state<=S0;
            elsif i_rst='0' then
                next_state<=S5;
            end if;
        when S5 =>
            if i_rst='1' then
                next_state<=S0;
            elsif i_rst='0' then
                next_state<=S6;
            end if;
        when S6 =>
            if i_rst='1' then
                next_state<=S0;
            elsif i_rst='0' then
                if iter_end='1' then
                    next_state<=S7;
                elsif zero='1' then
                    next_state<=S14;
                end if;
            end if;
        when S7 =>
            if i_rst='1' then
                next_state<=S0;
            elsif i_rst='0' then
                    next_state<=S8;
             end if;
        when S8 =>
            if i_rst='1' then
                next_state<=S0;
            elsif i_rst='0' then
                next_state<=S9;
            end if;
        when S9 =>
            if i_rst='1' then
                next_state<=S0;
            elsif i_rst='0' then
                next_state<=S10;
            end if;
        when S10 =>
            if i_rst='1' then
                next_state<=S0;
            elsif i_rst='0' then
                next_state<=S11;
            end if;
        when S11 =>
            if i_rst='1' then
                next_state<=S0;
            elsif i_rst='0' then
                next_state<=S12;
            end if;
        when S12 =>
            if i_rst='1' then
                next_state<=S0;
            elsif i_rst='0' then
                next_state<=S13;
            end if;
        when S13 =>
            if i_rst='1' then
                next_state<=S0;
            elsif i_rst='0' then
                next_state<=S14;
            end if;
        when S14 =>
            if i_rst='1' then
                next_state<=S0;
            elsif i_rst='0' then
                next_state<=S15;
            end if;
        when S15 =>
            if i_rst='1' then
                next_state<=S0;
            elsif i_rst='0' then
                next_state<=S16;
            end if;
        when S16=>
            if i_rst='1' then
                next_state<=S0;
            elsif i_rst='0' then
                next_state<=S17;
            end if;
        when S17 =>
            if i_rst='1' then
                next_state<=S0;
            elsif i_rst='0' then
                if iter_end='0' then
                    next_state<=S10;
                elsif iter_end='1' then
                    next_state<=S18;
                end if;
            end if;
        when S18 =>
            next_state<=S0;
    end case;
  end process;
  
  process(cur_state)
  begin
    add_addr<='1';
    o_en<='1';
    o_we<='0';
    col_load<='0';
    row_load<='0';
    iter_load<='0';
    dim_load<='0';
    max_load<='0';
    min_load<='0';
    r1_load<='0';
    o_done<='0';
    shift_load<='0';
    delta_load<='0';
    current_pixel_load<='0';
    r2_load<='0';
    ftp_load<='0';
    npv_load<='0';
    addr_sel<='0';
    reset<='0';

    
    case cur_state is
        when S0=>
            reset<='1';
            add_addr<='0';
        when S1=>
        when S2=>
        when S3=>
            col_load<='1';
            add_addr<='0';
        when S4=>
            row_load<='1';
            add_addr<='0';
        when S5=>
            dim_load<='1';
            r1_load<='1';
        when S6=>
            max_load<='1';
            min_load<='1';
            iter_load<='1';
            r1_load<='1';
        when S7=>
            delta_load<='1';
            add_addr<='0';
        when S8=>
            shift_load<='1';
            add_addr<='0';
        when S9=>
            add_addr<='0';
        when S10=>
            add_addr<='0';
        when S11=>
            current_pixel_load<='1';
            add_addr<='0';
            iter_load<='1';
        when S12=>
            add_addr<='0';
            r2_load<='1';
            addr_sel<='1';
        when S13=>
            add_addr<='0';
            ftp_load<='1';
            addr_sel<='1';
            o_we<='1';
        when S14=>
            npv_load<='1';
            addr_sel<='1';
            o_we<='1';
            add_addr<='0';
        when S15=>
            addr_sel<='1';
            o_we<='1';
            add_addr<='0';
        when S16=>
            addr_sel<='1';
            o_we<='1';
        when S17=>
            add_addr<='0';
        when S18=>
            o_done<='1';
    end case;
  end process;   
           
end Behavioral;

--DATAPATH

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Datapath is
    Port(
        i_clk : in STD_LOGIC;
        i_rst : in STD_LOGIC;
        i_data : in STD_LOGIC_VECTOR (7 downto 0);
        o_address : out STD_LOGIC_VECTOR(15 downto 0);
        o_data: out STD_LOGIC_VECTOR (7 downto 0);
        col_load : in STD_LOGIC;
        row_load : in STD_LOGIC;
        r1_load : in STD_LOGIC;
        max_load : in STD_LOGIC;
        min_load : in STD_LOGIC;
        dim_load : in STD_LOGIC;
        iter_load : in STD_LOGIC;
        iter_end: out STD_LOGIC;
        add_addr : in STD_LOGIC;
        shift_load : in STD_LOGIC;
        delta_load : in STD_LOGIC;
        current_pixel_load : in STD_LOGIC;
        r2_load : in STD_LOGIC;
        ftp_load : in STD_LOGIC;
        npv_load : in STD_LOGIC;
        addr_sel : in STD_LOGIC;
        reset : in STD_LOGIC;
        zero : out STD_LOGIC);        
end Datapath;

architecture Behavioral of Datapath is
signal reg1, row, col : std_logic_vector (7 downto 0);
signal max : std_logic_vector (7 downto 0) := (others=>'0');
signal min : std_logic_vector (7 downto 0) := (others=>'1');
signal temp_addr : std_logic_vector (15 downto 0) := (others=>'0');
signal dim : std_logic_vector (15 downto 0);
signal iter : std_logic_vector (15 downto 0);
signal shift : std_logic_vector (7 downto 0);
signal delta : std_logic_vector (7 downto 0);
signal current_pixel : std_logic_vector(7 downto 0);
signal reg2 : std_logic_vector(7 downto 0);
signal funct_temp_pixel : std_logic_vector(15 downto 0);
signal new_pixel_value : std_logic_vector(7 downto 0);
constant uno : std_logic_vector (15 downto 0) := (0=>'1', others=>'0');
constant duecentocinquantacinque : std_logic_vector (15 downto 0) := "0000000011111111";

begin

    --leggo dalla memoria
    process(i_clk, i_rst,reset)
    begin
        if(i_rst='1' or reset='1') then
            reg1<="00000000";
        elsif rising_edge(i_clk) then
            if(r1_load='1') then
                reg1<=i_data;
            end if;
        end if;
    end process;

    --scrivo righe
    process(i_clk, i_rst,reset)
    begin
        if(i_rst='1' or reset='1') then
            row<="00000000";
        elsif rising_edge(i_clk) then
            if(row_load='1') then
                row<=i_data;
            end if;
        end if;
    end process;
    
    --scrivo colonne
    process(i_clk, i_rst,reset)
    begin
        if(i_rst='1' or reset='1') then
            col<="00000000";
        elsif rising_edge(i_clk) then
            if(col_load='1') then
                col<=i_data;
            end if;
        end if;
    end process;

    --calcolo dimensione
    process(i_clk, i_rst,reset)
    begin
        if(i_rst='1' or reset='1') then
            dim<= (others => '0');
            zero<='0';
        elsif rising_edge(i_clk) then
            if(dim_load='1') then
                dim<=std_logic_vector(unsigned(col)*unsigned(row));
                if(row="00000000" or col="00000000") then
                    zero<='1';
                end if;
            end if;
        end if;
    end process;

    --incremento indirizzi per lettura e scrittura
    process(i_clk, i_rst,reset,delta_load)
    begin
        if(i_rst='1' or reset='1') then
            temp_addr<=(others => '0');
        elsif rising_edge(i_clk) then
            if (delta_load='1') then
                temp_addr<="0000000000000010";
            else
                if(add_addr='1') then
                    temp_addr<=std_logic_vector(unsigned(temp_addr) + unsigned(uno));
                elsif (add_addr='0') then
                    temp_addr<=temp_addr;
                end if;
                if(addr_sel='0') then
                        o_address<=temp_addr;
                elsif (addr_sel='1') then
                        o_address<=std_logic_vector(unsigned(dim) + unsigned(temp_addr));
                end if;
            end if;
        end if;
    end process;

    --incremento iterazioni
    process(i_clk, i_rst,reset,shift_load)
    begin
        if(i_rst='1' or reset='1') then
            iter<=(others => '0');
            iter_end<='0';
        elsif(shift_load='1') then
            iter<="0000000000000000";
            iter_end<='0';
        elsif rising_edge(i_clk) then
            if(iter=std_logic_vector(unsigned(dim)) and min_load='1') then
                iter_end<='1';
            elsif(iter=std_logic_vector(unsigned(dim)) and (ftp_load='1')) then
                iter_end<='1';
            elsif(iter_load='1') then
                iter<=std_logic_vector(unsigned(iter) + unsigned(uno));
                iter_end<='0';
            end if;
        end if;
    end process;
    
    --aggiornamento max e min
    process(i_clk, i_rst,reset)
    begin
        if(i_rst='1' or reset='1') then
            max<="00000000";
            min<="11111111";
        elsif rising_edge(i_clk) then
            if(max_load='1' and min_load='1') then
                if(reg1>max) then
                    max<=reg1;
                end if;
                if(reg1<min) then
                    min<=reg1;
                end if;
            end if;
        end if;
    end process;
    
    --calcolo delta
    process(i_clk, i_rst,reset)
    begin
        if(i_rst='1' or reset='1') then
            delta<="00000000";
        elsif rising_edge(i_clk) then
            if(delta_load='1') then
                delta<=std_logic_vector(unsigned(max) - unsigned(min));
            end if;
        end if;
     end process;
     
    --calcolo shift
    process(i_clk, i_rst,reset)
    begin
        if(i_rst='1' or reset='1') then
            shift<="00000000";
        elsif rising_edge(i_clk) then
            if(shift_load='1')then
                if(unsigned(delta)="00000000") then
                    shift<="00001000";
                elsif(unsigned(delta)>"00000000" and unsigned(delta)<="00000010") then
                    shift<="00000111";
                elsif(unsigned(delta)>"00000010" and unsigned(delta)<="00000110") then
                    shift<="00000110";
                elsif(unsigned(delta)>"00000110" and unsigned(delta)<="00001110") then
                    shift<="00000101";
                elsif(unsigned(delta)>"00001110" and unsigned(delta)<="00011110") then
                    shift<="00000100";
                elsif(unsigned(delta)>"00011110" and unsigned(delta)<="00111110") then
                    shift<="00000011";
                elsif(unsigned(delta)>"00111110" and unsigned(delta)<="01111110") then
                    shift<="00000010";
                elsif(unsigned(delta)>"01111110" and unsigned(delta)<="11111110") then
                    shift<="00000001";
                elsif(unsigned(delta)="11111111") then
                    shift<="00000000";
                end if;
                --temp_addr<="0000000000000001";
                --iter<="0000000000000000";
                --iter_end<='0';
            end if; 
         end if;
    end process;
               
    --rileggo dalla memoria
    process(i_clk, i_rst,reset)
    begin
        if(i_rst='1' or reset='1') then
            current_pixel<="00000000";
        elsif rising_edge(i_clk) then
            if(current_pixel_load='1') then
                current_pixel<=i_data;
            end if;
        end if;
    end process;
       
    --calcolo reg2
    process(i_clk, i_rst,reset)
    begin
        if(i_rst='1' or reset='1') then
            reg2<="00000000";
        elsif rising_edge(i_clk) then
            if(r2_load='1') then
                reg2<=std_logic_vector(unsigned(current_pixel) - unsigned(min));
            end if;
        end if;
    end process;
                  
    --calcolo funct_temp_pixel
    process(i_clk, i_rst,reset)
    begin
        if(i_rst='1' or reset='1') then
            funct_temp_pixel<=(others => '0');
        elsif rising_edge(i_clk) then
            if(ftp_load='1') then
                funct_temp_pixel<=std_logic_vector(shift_left("00000000" & unsigned(reg2), to_integer(unsigned((shift)))));
            end if;
        end if;
    end process;
                  
    --scelta new_pixel_value
    process(i_clk, i_rst,reset)
    begin
        if(i_rst='1' or reset='1') then
            new_pixel_value<="00000000";
        elsif rising_edge(i_clk) then
            if(npv_load='1') then
                if(funct_temp_pixel>=duecentocinquantacinque) then
                    new_pixel_value<=duecentocinquantacinque (7 downto 0);
                elsif (funct_temp_pixel<duecentocinquantacinque) then
                    new_pixel_value<=funct_temp_pixel (7 downto 0);
                end if;
            end if;
            o_data<=new_pixel_value;
        end if;
    end process;
                   
end Behavioral;


























