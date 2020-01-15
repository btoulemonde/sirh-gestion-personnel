package dev.sgp.filtre;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import dev.sgp.entite.VisiteWeb;
import dev.sgp.util.Constantes;

public class FrequentationFilter implements Filter{
	
	private FilterConfig config = null;
	private int  visite =0;
	
	@Override
	public void init(FilterConfig config) throws ServletException {
		this.config = config;
		config.getServletContext().log(" FrequentationFilter initialized");
		
	}

	

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		
		long before = System.currentTimeMillis();
		chain.doFilter(req, resp);
		long after = System.currentTimeMillis();
		String path = ((HttpServletRequest) req ).getRequestURI();
		config.getServletContext().log(path+":"+(after-before));
		
		int tempsExecution = Math.toIntExact(after - before);
		List<VisiteWeb> listeVisites = Constantes.VISIT_SERVICE.listerVisiteWeb();
		
		req.setAttribute("visites", listeVisites );
		
		Constantes.VISIT_SERVICE.sauvegarderVisiteWeb(new VisiteWeb(path, tempsExecution));
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	
	
	

}
