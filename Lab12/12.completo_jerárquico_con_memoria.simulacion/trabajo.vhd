LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ascensor IS
    PORT(
        clk, reset:   IN   std_logic;
        sensores:     IN   std_logic_vector(3 downto 0);
        pulsadores:   IN   std_logic_vector(3 downto 0);
        estadoPuerta: IN   std_logic;
        abrirPuerta:  OUT  std_logic;
        display:      OUT  std_logic_vector(1 downto 0);
        motor:        OUT  std_logic_vector(1 downto 0)
    );
END ascensor;

ARCHITECTURE ascensor_arq OF ascensor IS

    COMPONENT automata
        PORT(
           clk, reset:        IN   std_logic;
           sensores:          IN   std_logic_vector(3 downto 0);
           destino:           IN   std_logic_vector(3 downto 0);
           estadoPuerta:      IN   std_logic;
           abrirPuerta:       OUT  std_logic;
           motor:             OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    
    COMPONENT display
        PORT(
           clk,reset:       IN   std_logic;
           sensores:        IN   std_logic_vector(3 downto 0);
           pulsadores:      IN   std_logic_vector(3 downto 0);
           destino:         OUT  std_logic_vector(3 downto 0)   -- registro que memoriza el pulsador elegido
        );
    END COMPONENT;
    COMPONENT pulsadores
        PORT(
           clk,reset:       IN   std_logic;
           sensores:        IN   std_logic_vector(3 downto 0);
           display:         OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    
    SIGNAL DESTINO_SIGNAL: std_logic_vector(3 downto 0);

BEGIN

   U1: automata   PORT MAP(clk, reset, sensores, DESTINO_SIGNAL, estadoPuerta, abrirPuerta,motor);   
   U2: pulsadores PORT MAP(clk, reset, sensores, pulsadores, display, DESTINO_SIGNAL);
   U3: display    PORT MAP(clk, reset, sensores, display);

END ascensor_arq;





















