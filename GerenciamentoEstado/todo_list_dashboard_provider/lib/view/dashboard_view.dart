import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_dashboard_provider/controller/tarefa_controller.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard de Tarefas"),centerTitle: true,),
      body: Padding(
        padding: EdgeInsets.all(8),
        //consumer => widget do provider que permite a modificação de estado quando recebe as informações do Controller
        child: Consumer<TarefaController>(
          builder: (context, controller, child){
            return Column(
              children: [
                //aqui teremos uma lista de Card => com as métricas determinadas no controller
                // TotalTarefas
                _cardDashboard(
                  titulo: "Total de Tarefas", 
                  value: controller.totalTarefas.toString(), 
                  icon: Icons.list_alt, 
                  color: const Color.fromARGB(255, 243, 169, 221)),
                // TotalTarefas Concluídas
                _cardDashboard(titulo: "Total de Tarefas concluídas",
                  value: controller.totalTarefasConcluidas.toString(), 
                  icon: Icons.check_box, 
                  color: const Color.fromARGB(255, 228, 236, 152)),
                // TotalTarefaPendentes
                _cardDashboard(titulo: "Total de Tarefas pendentes",
                  value: controller.totalTarefasPendentes.toString(), 
                  icon: Icons.pending_actions, 
                  color: const Color.fromARGB(255, 153, 222, 243)),
                // PorcentagemTarefasConcluídas
                _cardDashboard(titulo: "Porcentagem de Tarefas Concluídas",
                  value: controller.porcentagemTarefasConcluidas.toString(), 
                  icon: Icons.percent, 
                  color: const Color.fromARGB(255, 152, 228, 162)),
              ],
            );
          }),),
    );
  }
}


//
Widget _cardDashboard ({
    required String titulo,
    required String value,
    required IconData icon,
    required Color color
  }){
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        //arredondar canto do retangulo
        borderRadius: BorderRadiusGeometry.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.15),
          child: Icon(icon, color: color,),
        ),
        title: Text(titulo, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        trailing: Text(value, style: TextStyle(fontSize: 24, color: color),),
      ),
    );

  }
