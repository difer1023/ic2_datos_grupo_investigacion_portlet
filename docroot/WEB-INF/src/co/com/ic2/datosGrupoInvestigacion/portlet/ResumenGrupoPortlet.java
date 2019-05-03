package co.com.ic2.datosGrupoInvestigacion.portlet;

import java.io.IOException;

import javax.portlet.GenericPortlet;
import javax.portlet.PortletException;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.PortletSession;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.servlet.http.HttpServletRequest;

import co.com.ic2.colciencias.gruplac.ClasificacionGrupo;
import co.com.ic2.colciencias.utilidades.properties.ParametrosProperties;
import co.com.ic2.facade.GrupoInvestigacionFacade;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.model.User;
import com.liferay.portal.util.PortalUtil;

public class ResumenGrupoPortlet extends GenericPortlet {

    public void init() {
        viewTemplate = getInitParameter("view-template");
    }

    public void doView(
            RenderRequest renderRequest, RenderResponse renderResponse)
        throws IOException, PortletException {

    	HttpServletRequest request=PortalUtil.getHttpServletRequest(renderRequest);
    	String vista=(String)request.getAttribute("view");
    	
    	GrupoInvestigacionFacade grupoInvestigacionFacade=new GrupoInvestigacionFacade();
    	User user = null;
		try {
			user = PortalUtil.getUser(renderRequest);
    	
			int anoFinVentanaObservacion = Integer
					.parseInt(ParametrosProperties.getInstance()
							.getPropiedadesPortal()
							.getProperty("anoFinVentanaObservacion"));
			
			int codigoGrupo=Integer.parseInt((String) user.getExpandoBridge().getAttribute("codigoGrupo"));
			
	    	String produccionPorAutor=grupoInvestigacionFacade.consultarProduccionPorAutor(
	    			codigoGrupo, anoFinVentanaObservacion);
	    	String produccionPorTipologia=grupoInvestigacionFacade.consultarProduccionPorTipologia(
	    			codigoGrupo, anoFinVentanaObservacion);
	    	
	    	PortletSession portletSession = renderRequest.getPortletSession();
	    	ClasificacionGrupo clasificacionGrupo=(ClasificacionGrupo) portletSession.getAttribute("clasificacionGrupoInvestigacion",PortletSession.APPLICATION_SCOPE);
	    	
	    	renderRequest.setAttribute("produccionPorAutor", produccionPorAutor);
	    	renderRequest.setAttribute("produccionPorTipologia", produccionPorTipologia);
	    	renderRequest.setAttribute("anoFinVentanaObservacion", anoFinVentanaObservacion);
	    	renderRequest.setAttribute("clasificacionGrupo", clasificacionGrupo.getClasificacionGrupo());
	    	renderRequest.setAttribute("clasificacionObjetivo", user.getExpandoBridge().getAttribute("clasificacionObjetivo"));
		} catch (PortalException | SystemException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	if (vista!=null){
    		include(vista, renderRequest, renderResponse);
    	}else{
    		include(viewTemplate, renderRequest, renderResponse);
    	}
    }

    protected void include(
            String path, RenderRequest renderRequest,
            RenderResponse renderResponse)
        throws IOException, PortletException {

        PortletRequestDispatcher portletRequestDispatcher =
            getPortletContext().getRequestDispatcher(path);

        if (portletRequestDispatcher == null) {
            _log.error(path + " is not a valid include");
        }
        else {
            portletRequestDispatcher.include(renderRequest, renderResponse);
        }
    }
 
    protected String viewTemplate;

    private static Log _log = LogFactoryUtil.getLog(ResumenGrupoPortlet.class);

}
