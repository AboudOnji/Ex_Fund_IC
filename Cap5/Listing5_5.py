def bfs_laberinto(laberinto, inicio, fin):
    cola = collections.deque([(inicio, [inicio])]) # (nodo_actual, camino_hasta_aqui)
    visitados = {inicio}

    while cola:
        (nodo, camino) = cola.popleft()
        if nodo == fin:
            return camino # Camino encontrado

        for vecino in obtener_vecinos_validos(laberinto, nodo):
            if vecino not in visitados:
                visitados.add(vecino)
                cola.append((vecino, camino + [vecino]))
    return None # No se encontró camino