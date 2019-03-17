# README

# Taller de innovación

# Problema de recordar la ingesta de medicamentos.

# Obligatorie de Taller de Innovación y diseño.


- Micaela Dutra - 185184
- Matías Settimo - 152946
- Pablo Ulguin - 152541

Link a la aplicación: https://pastillalert.herokuapp.com

Funcionamiento basico:

Para validar la solucion se da de alta una notificacion. La notificacion contiene los siguientes datos basicos:
- Medicamento
- Email al cual llegan las notificaciones
- Cadencia en minutos
- Desde una fecha-hora.

```
El software envia un email de confirmación de modicación programada.
Luego el software envia el recordatorio en cada intervalo de tiempo. 
(Nota: Por cada notificación vuelve a programar una nueva notificación. De forma recursiva.)
Por ultimo para dejar de recibir el recordatorio se debe borrar dicha programación.
```
