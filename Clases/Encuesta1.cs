using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Examen3__CesarSalas.Clases
{
    public class Encuesta1
    {
        public static int ParticipanteID { get; set; }
        public static String Nombre { get; set; }

        public static int Edad { get; set; }

        public static String CorreoElectronico { get; set; }
        public static String PartidoPolitico { get; set; }

        public Encuesta1(int ParticipanteID, string nombre,int Edad, string email, string PartidoPolitico)
        {
            Nombre = nombre;
            ParticipanteID = ParticipanteID;
            CorreoElectronico = email;
            PartidoPolitico = PartidoPolitico;
        }
        public Encuesta1(string nombre)
        {
            Nombre = nombre;
        }
        public Encuesta1()
        {

        }
        public static int Agregar(string nombre, string email, string telefono)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Dbconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("AgregarUsuario", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Nombre", nombre));
                    cmd.Parameters.Add(new SqlParameter("@Edad", Edad));
                    cmd.Parameters.Add(new SqlParameter("@CorreoElectronico", email));
                    cmd.Parameters.Add(new SqlParameter("@PartidoPolitico", PartidoPolitico));

                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;

        }

    }
}