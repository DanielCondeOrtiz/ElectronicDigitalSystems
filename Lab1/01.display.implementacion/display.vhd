LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY modulo_display IS
    PORT(
        clk,reset:       IN   std_logic;
        sensores:        IN   std_logic_vector(3 downto 0);
        
        display:         OUT  std_logic_vector(1 downto 0)
    );
END modulo_display;

ARCHITECTURE modulo_display_arq OF modulo_display IS
    SIGNAL display_aux   : std_logic_vector(1 downto 0);   -- captura de la planta actual
BEGIN
    -- ================================================================ 
    -- actualizaDisplay: Asignación concurrente para la salida "display" 
    -- ================================================================ 
    display <= display_aux;

    
    -- ================================================================ 
    -- Proceso secuencial (asigna la señal display_aux)
    -- ================================================================ 
    PROCESS (clk,reset)
    BEGIN
        IF (reset='1') THEN
            display_aux    <= "00";
        ELSIF (clk'EVENT AND clk='1') THEN
	        CASE (sensores) IS
				WHEN "0001" => display_aux<= "00";
				WHEN "0010" => display_aux<= "01";
				WHEN "0100" => display_aux<= "10";
				WHEN "1000" => display_aux<= "11";
				WHEN OTHERS => display_aux <= display_aux;
			END CASE;
        END IF;
    END PROCESS;



END modulo_display_arq;






















