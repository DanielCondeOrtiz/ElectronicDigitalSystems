LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY modulo_pulsadores IS
    PORT(
        clk,reset:       IN   std_logic;
        sensores:        IN   std_logic_vector(3 downto 0);
        pulsadores:      IN   std_logic_vector(3 downto 0);
        
        destino:         OUT  std_logic_vector(3 downto 0)   -- registro que memoriza el pulsador elegido
    );
END modulo_pulsadores;

ARCHITECTURE modulo_pulsadores_arq OF modulo_pulsadores IS
    SIGNAL destino_aux: std_logic_vector(3 downto 0);   -- captura del pulsador elegido  
BEGIN

    -- ================================================================ 
    -- LeerPulsadores: Asignación concurrente para la salida "destino" 
    -- ================================================================ 
   destino <= destino_aux;
    
    -- ================================================================ 
    -- Proceso secuencial (captura de los pulsadores)
    -- ================================================================ 
    PROCESS (clk,reset)
    BEGIN


    END PROCESS;



END modulo_pulsadores_arq;






















