 % 1.2
 stevilo_tock = input("Število točk, ki jih želite generirati:");
 n = input("Ponovi še enkrat:");
 n1 = n + 1;

 priblizki = zeros(stevilo_tock, 1);
 napake = zeros(stevilo_tock, 1);

 for i = 1:stevilo_tock
     [tocke_v_kr, tocke_v_kv] = mcc_pi(i);
     [priblizek, napaka] = area_pi(tocke_v_kr, tocke_v_kv);
     priblizki(i) = priblizek;
     napake(i) = napaka;
 end

 % Izpis rezultatov
 fprintf('Število točk\tPribližana vrednost π\tNapaka\n');
 for i = 1:stevilo_tock
     fprintf('%d\t\t%.6f\t\t%.6f\n', i, priblizki(i), napake(i));
 end
%1.3%
lok_kroz = @(r,phi) [r * cos(phi), r * sin(phi)];
%1.4%
% Generiranje kotnih parametrov za loka krožnice
phi = linspace(0, 2*pi, stevilo_tock);
r = 1;
lokacija_na_kroznici = lok_kroz(r, phi);

% Vizualizacija točk in loka krožnice
figure;
scatter(tocke_v_kv(:, 1), tocke_v_kv(:, 2), 'red', 'filled');
hold on;
scatter(tocke_v_kr(:, 1), tocke_v_kr(:, 2), 'cyan', 'filled');
plot(lokacija_na_kroznici(1:n), lokacija_na_kroznici(n1:2*n), "b")
hold off;

axis equal;

title('Prikaz random točk na območju kroga')
legend('točke u krogu', 'točke ne notr u krogu', 'krožnca')
xlabel 'x'
ylabel 'y'

function [priblizek, napaka] = area_pi(tocke_v_kr, tocke_v_kv)
    % Število točk znotraj kroga
    st_zn_kr = size(tocke_v_kr, 1);

    % Število točk znotraj kvadrata
    st_zn_kv = size(tocke_v_kv, 1);

    % Približek za π
    priblizek = 4 * st_zn_kr / st_zn_kv;

    % Napaka v primerjavi s π
    napaka = abs(priblizek - pi);
end
