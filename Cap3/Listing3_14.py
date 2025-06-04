class Perro:
    # Constructor
    def __init__(self, nombre, raza):
        self.nombre = nombre # Atributo de instancia
        self.raza = raza     # Atributo de instancia

    # Método de instancia
    def ladrar(self):
        print(f'{self.nombre} dice: Guau!')

# Crear objetos (instancias) de la clase Perro
mi_perro1 = Perro('Fido', 'Labrador')
mi_perro2 = Perro('Luna', 'Poodle')

print(mi_perro1.nombre) # Salida: Fido
mi_perro2.ladrar()      # Salida: Luna dice: Guau!