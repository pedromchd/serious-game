function src_dialogues() {
	switch obj_name {
		default:
			break;
		case "start":
			ds_grid_add_text("Depois de um dia cheio, nada melhor que chegar em casa!", spr_portrait_2, 0, "Jeff");
			ds_grid_add_text("Estive a semana toda ocupado com o processo seletivo para uma fábrica de bicicletas local, a Von Drais.", spr_portrait_1, 0, "Jeff");
			ds_grid_add_text("E hoje eles me retornarão com a resposta!", spr_portrait_2, 0, "Jeff");
			ds_grid_add_text("Por isso, tenho que estar atento à mensagem deles.", spr_portrait_1, 0, "Jeff");
			break;
		case "dresser1":
			ds_grid_add_text("Meu guarda-roupa! Não tem muitas roupas, trouxe poucas desde minha mudança para esta cidade maravilhosa, a caidade de Oikos!", spr_portrait_1, 1, "Jeff");
			ds_grid_add_text("Então acabei com apenas as casuais e umas para ocasiões importantes, como para um emprego!", spr_portrait_2, 1, "Jeff");
			break;
		case "drawer1":
			ds_grid_add_text("Minha gaveta com meus pertences, como documentos, acessórios e outros.", spr_portrait_1, 0, "Jeff");
			ds_grid_add_text("Devo me certificar de não esquecer nada para quando sair de casa!", spr_portrait_2, 0, "Jeff");
			break;
		case "computer1":
			ds_grid_add_text("Olha só! Tem uma nova mensagem para mim!", spr_portrait_1, 1, "Jeff");
			add_op("Fechar", "CLOSEPS1");
			add_op("Ler a mensagem", "READMSG1");
			break;
				case "CLOSEPS1":
					ds_grid_add_text("Não deve ser muito urgente... leio outra hora.", spr_portrait_1, 1, "Jeff");
					break;
				case "READMSG1":
					global.computer.email = true;
					ds_grid_add_text("Que legal! É o retorno da Von Drais sobre meu processo seletivo!", spr_portrait_2, 1, "Jeff", "afteremail1");
					break;
		case "afteremail1":
			ds_grid_add_text("Estou tão feliz que consegui! Amanhã vai ser um dia especial!", spr_portrait_2, 0, "Jeff");
			ds_grid_add_text("Então é melhor que eu durma logo pra poder me organizar o quanto antes.", spr_portrait_2, 0, "Jeff");
				break;
	}
}

function start_dialogue(_name) {
	if !global.dialogue {
		var _dialogue = instance_create_layer(0, 0, "Dialogue", obj_dialogue);
		_dialogue.obj_name = _name;
	}	
}

function add_op(_txt, _ans) {
	op[op_num] = _txt;
	op_ans[op_num] = _ans;

	op_num++;
}

function ds_grid_add_row(){
	///@arg ds_grid
 
	var _grid = argument[0];
	ds_grid_resize(_grid,ds_grid_width(_grid),ds_grid_height(_grid)+1);
	return(ds_grid_height(_grid)-1);	
}

function ds_grid_add_text(){
	///@arg text
	///@arg imge
	///@arg side
	///@arg name
	///@arg next
 
	var _grid = dialogues;
	var _y = ds_grid_add_row(_grid);
 
	_grid[# 0, _y] = argument[0];
	_grid[# 1, _y] = argument[1];
	_grid[# 2, _y] = argument[2];
	_grid[# 3, _y] = argument[3];
	_grid[# 4, _y] = argument[4];
}
