function [tocke_v_kr, tocke_v_kv] = mcc_pi(stevilo_tock)
     %generacija naključnih točk med -1 in 1%
    x = 2 * rand(stevilo_tock, 1) - 1;
    y = 2 * rand(stevilo_tock, 1) - 1;
     %preverjamo če je koordinata znotraj ali izven kroga
    razdalja = sqrt(x.^2 + y.^2);
    % vektor, ki določa katere točke ustrezajo zgornjemu pogoju
    znotraj_kroga = razdalja <= 1;
    %elementi iz vektorja x, ki ustrezajo "true" vrednostim v zg. vektorju
    tocke_v_kr = [x(znotraj_kroga), y(znotraj_kroga)];
    %vsi elementi iz vektorjev x in y.
    tocke_v_kv = [x, y];
end