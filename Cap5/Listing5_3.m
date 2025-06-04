% Generar un único número aleatorio N(mu, sigma)
mu = 5.0;      % Media deseada
sigma = 2.0;   % Desviación estándar deseada
numero_gaussiano = mu + sigma * randn();
disp(['Número Gaussiano N(5, 2^2): ', num2str(numero_gaussiano)]);

% Generar un vector de 1x5 números aleatorios N(mu, sigma)
vector_gaussiano = mu + sigma * randn(1, 5);
disp('Vector Gaussiano N(5, 2^2):');
disp(vector_gaussiano);

% Alternativamente, usando normrnd de la Statistics and Machine Learning Toolbox
% (si está disponible)
% numero_gaussiano_normrnd = normrnd(mu, sigma);
% vector_gaussiano_normrnd = normrnd(mu, sigma, [1, 5]);

% Para inicializar la semilla del generador (afecta a rand, randn, etc.)
rng(0); % Semilla '0' para reproducibilidad
numero_gaussiano_con_semilla = mu + sigma * randn();
disp(['Número Gaussiano con semilla: ', num2str(numero_gaussiano_con_semilla)]);
rng('shuffle'); % Vuelve a una semilla basada en el tiempo actual