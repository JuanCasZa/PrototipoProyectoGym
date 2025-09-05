using PrototipadoProyecto.Modelos.Ventas;

public class Suplementos
{
    private int Id;
    private String NombreSuplemento { get; set; }
    private String TipoSuplemento { get; set; }
    private decimal Valor { get; set; }
    private Pagos Pagos { get; set; }
}