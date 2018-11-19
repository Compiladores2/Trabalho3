
/*
 * generated by Xtext 2.15.0
 */
package trabalho3.generator

import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.AbstractGenerator
import org.eclipse.xtext.generator.IFileSystemAccess2
import org.eclipse.xtext.generator.IGeneratorContext
import trabalho3.receitaHTML.Ingrediente
import trabalho3.receitaHTML.MetodoAssar
import trabalho3.receitaHTML.MetodoBater
import trabalho3.receitaHTML.MetodoFritar
import trabalho3.receitaHTML.MetodoMisturar
import trabalho3.receitaHTML.MetodoPicar
import trabalho3.receitaHTML.MetodoUntar
import trabalho3.receitaHTML.Receita
import trabalho3.receitaHTML.Temperatura
import trabalho3.receitaHTML.Tempo
import trabalho3.receitaHTML.Utensilio

/**
 * Generates code from your model files on save.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#code-generation
 */
class ReceitaHTMLGenerator extends AbstractGenerator {

	override void doGenerate(Resource resource, IFileSystemAccess2 fsa, IGeneratorContext context) {
        //val prog = resource as Programa;
        
        //for( r : prog.receitas ) {
        for (r : resource.allContents.toIterable.filter(Receita)) {
            fsa.generateFile(
                r.name + ".html",
                r.compile)
        }
        
    }
 
	def compile(Receita e) ''' 
		<html>
		<header><title>Receita «e.tipo.toString()» de «e.name»</title></header>
		<body>
		<center>
		<h1> «e.name» </h1>
		</center>
		<br><br>
		<center>
		«FOR i : e.img»
			<img src= '«i.name»'>
			<br>
		«ENDFOR»
		</center>
		
		«IF e.corpo.necessidades.filter(Ingrediente) !== null»
			Ingredientes:<br>
			<ul>
			«FOR n:e.corpo.necessidades.filter(Ingrediente)»
				«n.compileNecessidade» 
			«ENDFOR»
			</ul>
		<br>
		«ENDIF»
		
		«IF e.corpo.necessidades.filter(Utensilio) !== null»
			Utensilios:<br>
			<ul>
			«FOR n:e.corpo.necessidades.filter(Utensilio)»
				«n.compileNecessidade»
			«ENDFOR»
			</ul>
		<br>
		«ENDIF»
		<br>
		Modo de Preparo
		<br>
		«FOR m : e.corpo.modoDePreparo.metodo»
		   	«m.compileMetodo»
		«ENDFOR»
		<br>
		</body>
		</html>
    '''
    
    def dispatch compileNecessidade(Ingrediente i) '''<li> «escreveNumero(i.quantidade)» «i.escreveUnidadeDeMedida» de «i.name» </li>'''
	
	def dispatch compileNecessidade(Utensilio u) '''<li> «u.name» </li>'''
    
   def dispatch compileMetodo(MetodoBater mb) '''Bata 
	«IF mb.usoDeIngrediente.length > 1»
		«FOR ing : mb.usoDeIngrediente»
			«IF mb.usoDeIngrediente.get(0).ingredientes.name == ing.ingredientes.name»
				«escreveNumero(ing.quantidade)» «ing.ingredientes.escreveUnidadeDeMedida» de «ing.ingredientes.name»
			«ELSE»
				«IF mb.usoDeIngrediente.last.ingredientes.name == ing.ingredientes.name»
					e «escreveNumero(ing.quantidade)» «ing.ingredientes.escreveUnidadeDeMedida» de «ing.ingredientes.name»
				«ELSE»
					, «escreveNumero(ing.quantidade)» «ing.ingredientes.escreveUnidadeDeMedida» de «ing.ingredientes.name»
				«ENDIF»
			«ENDIF»
		«ENDFOR»
	«ELSE»
		«FOR ing : mb.usoDeIngrediente»
			«escreveNumero(ing.quantidade)» «ing.ingredientes.escreveUnidadeDeMedida» de «ing.ingredientes.name»
		«ENDFOR»
	«ENDIF»
por «mb.tempo.escreveTempo» para fazer «escreveNumero(mb.subProduto.quantidade)» «mb.subProduto.escreveUnidadeDeMedida» de «mb.subProduto.name».'''
   
   def dispatch compileMetodo(MetodoUntar mu) '''Unte «mu.utensilio.name» usando «mu.ingredientes.name».'''
   
   def dispatch compileMetodo(MetodoAssar ma) '''Asse 
   «FOR ing : ma.usoDeIngrediente»
		«escreveNumero(ing.quantidade)» «ing.ingredientes.escreveUnidadeDeMedida» de «ing.ingredientes.name»
	«ENDFOR» 
a «escreveNumero(ma.temperatura.temp)» «ma.temperatura.escreveUnidadeDeTemperatura» por «ma.tempo.escreveTempo».'''
   	
   def dispatch compileMetodo(MetodoMisturar mm) '''Misture
   «IF mm.usoDeIngrediente.length > 1»
   		«FOR ing : mm.usoDeIngrediente»
   			«IF mm.usoDeIngrediente.get(0).ingredientes.name == ing.ingredientes.name»
   				«escreveNumero(ing.quantidade)» «ing.ingredientes.escreveUnidadeDeMedida» de «ing.ingredientes.name»
   			«ELSE»
   				«IF mm.usoDeIngrediente.last.ingredientes.name == ing.ingredientes.name»
   			 		e «escreveNumero(ing.quantidade)» «ing.ingredientes.escreveUnidadeDeMedida» de «ing.ingredientes.name»
   				«ELSE»
   					, «escreveNumero(ing.quantidade)» «ing.ingredientes.escreveUnidadeDeMedida» de «ing.ingredientes.name»
   				«ENDIF»
   			«ENDIF»
   		«ENDFOR»
   	«ELSE»
   		«FOR ing : mm.usoDeIngrediente»
   			«escreveNumero(ing.quantidade)» «ing.ingredientes.escreveUnidadeDeMedida» de «ing.ingredientes.name»
   		«ENDFOR»
   	«ENDIF» para fazer «escreveNumero(mm.subProduto.quantidade)» «mm.subProduto.escreveUnidadeDeMedida» de «mm.subProduto.name».'''
   	
   def dispatch compileMetodo(MetodoPicar mp) '''Pique 
      «IF mp.usoDeIngrediente.length > 1»
      		«FOR ing : mp.usoDeIngrediente»
      			«IF mp.usoDeIngrediente.get(0).ingredientes.name == ing.ingredientes.name»
      				«escreveNumero(ing.quantidade)» «ing.ingredientes.escreveUnidadeDeMedida» de «ing.ingredientes.name»
      			«ELSE»
      				«IF mp.usoDeIngrediente.last.ingredientes.name == ing.ingredientes.name»
      			 		e «escreveNumero(ing.quantidade)» «ing.ingredientes.escreveUnidadeDeMedida» de «ing.ingredientes.name»
      				«ELSE»
      					, «escreveNumero(ing.quantidade)» «ing.ingredientes.escreveUnidadeDeMedida» de «ing.ingredientes.name»
      				«ENDIF»
      			«ENDIF»
      		«ENDFOR»
      	«ELSE»
      		«FOR ing : mp.usoDeIngrediente»
      			«escreveNumero(ing.quantidade)» «ing.ingredientes.escreveUnidadeDeMedida» de «ing.ingredientes.name»
      		«ENDFOR»
      	«ENDIF».'''
  
   def dispatch compileMetodo(MetodoFritar mf) '''Frite 
   	«IF mf.usoDeIngrediente.length > 1»
   		«FOR ing : mf.usoDeIngrediente»
   			«IF mf.usoDeIngrediente.get(0).ingredientes.name == ing.ingredientes.name»
   				«escreveNumero(ing.quantidade)» «ing.ingredientes.escreveUnidadeDeMedida» de «ing.ingredientes.name»
   			«ELSE»
   				«IF mf.usoDeIngrediente.last.ingredientes.name == ing.ingredientes.name»
   			 		e «escreveNumero(ing.quantidade)» «ing.ingredientes.escreveUnidadeDeMedida» de «ing.ingredientes.name»
   				«ELSE»
   					, «escreveNumero(ing.quantidade)» «ing.ingredientes.escreveUnidadeDeMedida» de «ing.ingredientes.name»
   				«ENDIF»
   			«ENDIF»
   		«ENDFOR»
   	«ELSE»
   		«FOR ing : mf.usoDeIngrediente»
   			«escreveNumero(ing.quantidade)» «ing.ingredientes.escreveUnidadeDeMedida» de «ing.ingredientes.name»
   		«ENDFOR»
   	«ENDIF»
   por «mf.tempo.escreveTempo».'''
   
   def escreveUnidadeDeMedida(Ingrediente i)'''
		«IF i.tipo == "colherDeSopa"»
				«IF i.quantidade < 2»
					colher de sopa
				«ELSE»
					colheres de sopa
				«ENDIF»
			«ELSE»
				«IF i.tipo == "colherDeCha"»
					«IF i.quantidade < 2»
						colher de cha
					«ELSE»
						colheres de cha
					«ENDIF»
				«ELSE»
					«IF i.tipo == "xicaraDeCha"»
						«IF i.quantidade < 2»
							xicara de cha
						«ELSE»
							xicaras de cha
						«ENDIF»
					«ELSE»
						«IF i.tipo == "unidade"»
							«IF i.quantidade < 2»
								unidade
							«ELSE»
								unidades
							«ENDIF»
						«ELSE»
							«i.tipo»
						«ENDIF»
					«ENDIF»
				«ENDIF»
			«ENDIF»
	'''
	
	def escreveUnidadeDeTemperatura(Temperatura t)'''
		«IF t.medida == 'c'»
		   		graus Celsius
		   	«ELSE»
		   		«IF t.medida == 'f'»
		   			graus Fahrenheit
		   		«ELSE»
		   			Kelvin
		   		«ENDIF»
		   	«ENDIF»
	'''
   
   def escreveTempo(Tempo t)'''
   «escreveNumero(t.quantidade)»«t.unidade»
   '''
   
   def escreveNumero(Float n)'''
   «IF n == n.intValue»
   «n.intValue.toString»
   «ELSE»
   «n.toString»
   «ENDIF»
   '''
}
	