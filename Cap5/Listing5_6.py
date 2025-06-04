def a_star_rutas(mapa, inicio, fin, heuristica):
    # frontera es una cola de prioridad ordenada por f(n) = g(n) + h(n)
    frontera = [(heuristica(inicio, fin), 0, inicio, [inicio])] # (f, g, nodo, camino)
    explorados = set()

    while frontera:
        f_val, g_val, nodo_actual, camino = heapq.heappop(frontera) # Extrae el de menor f

        if nodo_actual == fin:
            return camino

        if nodo_actual in explorados:
            continue
        explorados.add(nodo_actual)

        for vecino, costo_paso in obtener_vecinos_con_costo(mapa, nodo_actual):
            if vecino not in explorados:
                nuevo_g = g_val + costo_paso
                nuevo_f = nuevo_g + heuristica(vecino, fin)
                heapq.heappush(frontera, (nuevo_f, nuevo_g, vecino, camino + [vecino]))
    return None