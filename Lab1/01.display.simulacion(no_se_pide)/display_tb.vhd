LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

--Declaración de la entidad
ENTITY testd IS
END    testd;

ARCHITECTURE testd_arq OF testd IS
    --Declaración de componentes
    COMPONENT modulo_display
    PORT(
        clk,reset:       IN   std_logic;
        sensores:        IN   std_logic_vector(3 downto 0);
        
        modulo_display:         OUT  std_logic_vector(1 downto 0)
    );
    END COMPONENT;

SIGNAL clk_tb, reset_tb:  std_logic;
SIGNAL sensores_tb:       std_logic_vector(3 downto 0);
SIGNAL display_tb:        std_logic_vector(1 downto 0);

SIGNAL fin_tb:            std_logic := '0' ;          -- Indica fin de simulación. Se pone a '1' al final de la simulacion. 

constant ciclo : time := 100 ns; 


BEGIN
    -- Se crea el componente del tipo 'tren' 
    -- Se conecta a las señales internas de la arquitectura
    U1: modulo_display PORT MAP( clk_tb, reset_tb, sensores_tb,  display_tb);


    -- -----------------------------
    --proceso que genera el reloj
    -- -----------------------------
    GenCLK: process
    begin
        if (fin_tb='1') THEN
            clk_tb<= '0';      wait for 2*ciclo;
        ELSE
            clk_tb<= '0';      wait for ciclo/2;
            clk_tb<= '1';      wait for ciclo/2;
        END IF;
    end process GenCLK;


    -- -----------------------------
    --proceso que genera las entradas
    -- -----------------------------
    PROCESS
    BEGIN
        --Inicialización
        fin_tb <= '0';                          -- deja pasara el reloj
        sensores_tb <= "0010";                  -- planta uno
        reset_tb  <= '1';
            wait for 3*ciclo/4;                 -- Nos situamos antes del flanco de bajada del reloj

        
        -- reset='0'. Termina el reset
        reset_tb <= '0';
            wait for ciclo*2;

        sensores_tb <= "0000";                  -- Entreplanta
            wait for ciclo*4;
        sensores_tb <= "0100";                 -- Llegó a la planta 2 --> reinicia el registro
            wait for ciclo*2;

        sensores_tb <= "0000";                  -- Entreplanta
            wait for ciclo*4;
        sensores_tb <= "1000";                 -- Llegó a la planta 3 --> reinicia el registro
            wait for ciclo*2;


       fin_tb <= '1';      -- para el proceso del reloj (queda fijo)
       wait;               -- espera infinita: fin de simulación
    end process;
END testd_arq;












