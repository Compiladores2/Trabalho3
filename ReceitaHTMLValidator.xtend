/*
 * generated by Xtext 2.15.0
 */
package trabalho3.validation

import org.eclipse.xtext.validation.Check
import trabalho3.receitaHTML.Corpo
import trabalho3.receitaHTML.Ingrediente
import trabalho3.receitaHTML.IngredienteASerUsado
import trabalho3.receitaHTML.Metodo
import trabalho3.receitaHTML.MetodoAssar
import trabalho3.receitaHTML.MetodoBater
import trabalho3.receitaHTML.MetodoFritar
import trabalho3.receitaHTML.MetodoMisturar
import trabalho3.receitaHTML.MetodoPicar
import trabalho3.receitaHTML.ReceitaHTMLPackage

/**
 * This class contains custom validation rules. 
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#validation
 */
class ReceitaHTMLValidator extends AbstractReceitaHTMLValidator {

	@Check
	def void checkGreaterThanZero(Ingrediente i) {
		//  Verifica se a quantidade de ingredientes declarados é maior que zero
		if (i.quantidade <= 0) {
			warning("Quantidade deve ser maior que zero", ReceitaHTMLPackage.Literals.INGREDIENTE__QUANTIDADE);
		}
	}

	@Check
	def void checkNumber(Corpo c) {
		// Verifica se a quantidade de ingredientes usada eh igual ou menor a quantidade declarada
		for (Ingrediente i : c.necessidades.filter(Ingrediente)) {
				var qtd = i.quantidade
				for (Metodo m : c.modoDePreparo.metodo) {
					switch (m) {
						MetodoBater:
							for (IngredienteASerUsado iasu : m.usoDeIngrediente) {
								if (i == iasu.ingredientes) {
									qtd -= iasu.quantidade
								}
							}
						MetodoMisturar:
							for (IngredienteASerUsado iasu : m.usoDeIngrediente) {
								if (i == iasu.ingredientes) {
									qtd -= iasu.quantidade
								}
							}
						MetodoPicar:
							for (IngredienteASerUsado iasu : m.usoDeIngrediente) {
								if (i == iasu.ingredientes) {
									qtd -= iasu.quantidade
								}
							}
						MetodoFritar:
							for (IngredienteASerUsado iasu : m.usoDeIngrediente) {
								if (i == iasu.ingredientes) {
									qtd -= iasu.quantidade
								}
							}
						MetodoAssar:
							for (IngredienteASerUsado iasu : m.usoDeIngrediente) {
								if (i == iasu.ingredientes) {
									qtd -= iasu.quantidade
								}
							}
					}
			}
			if(qtd < 0) {
				error("Ingrediente "+i.name+" errado para menos", i, ReceitaHTMLPackage.Literals.INGREDIENTE__QUANTIDADE)
			}
		}
		
		// Verifica se a quantidade de subprodutos gerada eh igual ou menor a quantidade de subprodutos usada
		// Os subprodutos gerados sao buscados em cada metodo e
		// para cada subproduto eh feita a verificacao de uso nos outros metodos
		for (MetodoBater mb : c.modoDePreparo.metodo.filter(MetodoBater)) {
			var qtd = mb.subProduto.quantidade
			
			for (Metodo m : c.modoDePreparo.metodo) {
				switch (m) {
					MetodoBater:
						for (IngredienteASerUsado iasu : m.usoDeIngrediente) {
							if (mb.subProduto == iasu.ingredientes) {
								qtd -= iasu.quantidade
							}
						}
					MetodoMisturar:
						for (IngredienteASerUsado iasu : m.usoDeIngrediente) {
							if (mb.subProduto == iasu.ingredientes) {
								qtd -= iasu.quantidade
							}
						}
					MetodoPicar:
						for (IngredienteASerUsado iasu : m.usoDeIngrediente) {
							if (mb.subProduto == iasu.ingredientes) {
								qtd -= iasu.quantidade
							}
						}
					MetodoFritar:
						for (IngredienteASerUsado iasu : m.usoDeIngrediente) {
							if (mb.subProduto == iasu.ingredientes) {
								qtd -= iasu.quantidade
							}
						}
					MetodoAssar:
						for (IngredienteASerUsado iasu : m.usoDeIngrediente) {
							if (mb.subProduto == iasu.ingredientes) {
								qtd -= iasu.quantidade
							}
						}
				}
			}
			
			if(qtd < 0) {
				error("Ingrediente "+mb.subProduto.name+" errado para menos", mb.subProduto, ReceitaHTMLPackage.Literals.INGREDIENTE__QUANTIDADE)
			}
		}
		
		for (MetodoMisturar mm : c.modoDePreparo.metodo.filter(MetodoMisturar)) {
			var qtd = mm.subProduto.quantidade
			
			for (Metodo m : c.modoDePreparo.metodo) {
				switch (m) {
					MetodoBater:
						for (IngredienteASerUsado iasu : m.usoDeIngrediente) {
							if (mm.subProduto == iasu.ingredientes) {
								qtd -= iasu.quantidade
							}
						}
					MetodoMisturar:
						for (IngredienteASerUsado iasu : m.usoDeIngrediente) {
							if (mm.subProduto == iasu.ingredientes) {
								qtd -= iasu.quantidade
							}
						}
					MetodoPicar:
						for (IngredienteASerUsado iasu : m.usoDeIngrediente) {
							if (mm.subProduto == iasu.ingredientes) {
								qtd -= iasu.quantidade
							}
						}
					MetodoFritar:
						for (IngredienteASerUsado iasu : m.usoDeIngrediente) {
							if (mm.subProduto == iasu.ingredientes) {
								qtd -= iasu.quantidade
							}
						}
					MetodoAssar:
						for (IngredienteASerUsado iasu : m.usoDeIngrediente) {
							if (mm.subProduto == iasu.ingredientes) {
								qtd -= iasu.quantidade
							}
						}
				}
				
			}
			
			if(qtd < 0) {
				error("Ingrediente "+mm.subProduto.name+" errado para menos", mm.subProduto, ReceitaHTMLPackage.Literals.INGREDIENTE__QUANTIDADE)
				
			}
		}
		
		for (MetodoPicar mp : c.modoDePreparo.metodo.filter(MetodoPicar)) {
			var qtd = mp.subProduto.quantidade
			
			for (Metodo m : c.modoDePreparo.metodo) {
				switch (m) {
					MetodoBater:
						for (IngredienteASerUsado iasu : m.usoDeIngrediente) {
							if (mp.subProduto == iasu.ingredientes) {
								qtd -= iasu.quantidade
							}
						}
					MetodoMisturar:
						for (IngredienteASerUsado iasu : m.usoDeIngrediente) {
							if (mp.subProduto == iasu.ingredientes) {
								qtd -= iasu.quantidade
							}
						}
					MetodoPicar:
						for (IngredienteASerUsado iasu : m.usoDeIngrediente) {
							if (mp.subProduto == iasu.ingredientes) {
								qtd -= iasu.quantidade
							}
						}
					MetodoFritar:
						for (IngredienteASerUsado iasu : m.usoDeIngrediente) {
							if (mp.subProduto == iasu.ingredientes) {
								qtd -= iasu.quantidade
							}
						}
					MetodoAssar:
						for (IngredienteASerUsado iasu : m.usoDeIngrediente) {
							if (mp.subProduto == iasu.ingredientes) {
								qtd -= iasu.quantidade
							}
						}
				}
				
			}
			
			if(qtd < 0) {
				error("Ingrediente "+mp.subProduto.name+" errado para menos", mp.subProduto, ReceitaHTMLPackage.Literals.INGREDIENTE__QUANTIDADE)
			}
		}
		

	}

}
