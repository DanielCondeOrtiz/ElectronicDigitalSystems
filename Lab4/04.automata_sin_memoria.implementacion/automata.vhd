LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.STD_LOGIC_ARITH.ALL;

ENTITY modulo_automata IS
    PORT(
        clk, reset:        IN   std_logic;
        sensores:          IN   std_logic_vector(3 downto 0);
        destino:           IN   std_logic_vector(3 downto 0);
        estadoPuerta:      IN   std_logic;

        abrirPuerta:  OUT  std_logic;
        motor:        OUT  std_logic_vector(1 downto 0)
    );
END modulo_automata;

ARCHITECTURE modulo_automata_arq OF modulo_automata IS
    TYPE ESTADOS is (reposo, cerrandoPuerta, moviendose, pulsoAbrirPuerta, esperaApertura);
    SIGNAL estado: estados;
    SIGNAL subiendo : std_logic;

BEGIN

    PROCESS (clk,reset)
    BEGIN
        IF (reset='1') THEN             -- Si se activa el reset
            estado <= reposo;           -- Pasamos al estado de reposo
            subiendo<='0';
        ELSIF (clk'EVENT AND clk='1') THEN      -- Cada flanco de subida

		    -- todo el código tiene que estar aquí para que esté sincronizado
			-- con el flanco de subida del reloj

        END IF;
    END PROCESS;
END modulo_automata_arq;




























