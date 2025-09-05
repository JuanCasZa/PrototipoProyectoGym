using PrototipadoProyecto.Modelos.InstrumentosActividades;

public class Equipamientos : Instrumentos, IMantenimientos
{
    //Atributos
    private int Id;
    private int CantidadEqui { get; set; }

    //Metodos
     public bool Mantenimiento {
        get => throw new NotImplementedException(); set => throw new NotImplementedException(); }
}