/*
 * generated by Xtext 2.15.0
 */
package trabalho3.validation

import org.eclipse.xtext.validation.Check
import trabalho3.receitaHTML.Corpo
import trabalho3.receitaHTML.Ingrediente
import trabalho3.receitaHTML.IngredienteASerUsado
import trabalho3.receitaHTML.Metodo
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
	def void checkNameStartsWithCapital(Ingrediente i) {
		if (!Character.isUpperCase(i.name.charAt(0))) {
			warning("Name should start with a capital", ReceitaHTMLPackage.Literals.INGREDIENTE__TIPO);
		}
	}

	@Check
	def void checkGreaterThanZero(Ingrediente i) {
		if (i.quantidade <= 0) {
			warning("Quantidade deve ser maior que zero", ReceitaHTMLPackage.Literals.INGREDIENTE__QUANTIDADE);
		}
	}

	@Check
	def void checkNumber(Corpo c) {
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
				}
			}
			if(qtd < 0) {
				error("Ingrediente "+i.name+" errado para menos", i, ReceitaHTMLPackage.Literals.INGREDIENTE__QUANTIDADE)
				//error("Corpo errado", c, ReceitaHTMLPackage.Literals.CORPO__NECESSIDADES)
			}
		}
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
				}
				
			}
			
			if(qtd < 0) {
				error("Ingrediente "+mb.subProduto.name+" errado para menos", mb.subProduto, ReceitaHTMLPackage.Literals.INGREDIENTE__QUANTIDADE)
				//error("Corpo errado", c, ReceitaHTMLPackage.Literals.CORPO__NECESSIDADES)
			}
		}
		

	}

}
