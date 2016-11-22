cells = 20;
groups = 3;
convergence = 10000;
sigmas = [0.1 0.0 0.0;0.3 0.1 0.1; 0.1 0.3 0.3];
sigmat = [0.5, 0.8, 1.0];
q =[1.5,0,.2];
mu = [0.2, 0.5, 0.7];
alpha = 0.5;
fluxm = 0;
%loop energies
for gp = 1:3
for g = 1:3
    
%converge each energy
while converged ~= 1

% sweepfor each angle    
for m = 1:3
%for group 1 boundary is = 0.5
if (gp==1) && (g==1) && (i==1) 
    fluxm = 0.5;
end
             
             for i=1:cells;
             
             for p=1:3
             src(i) = 2*pi*(sig) + q(g);
             end
             
             fluxf(i) = (src(i)+((2*mu(m))/((1+alpha)*deltax))*fluxm)/ (sigmat(g) + (2*mu)/( (1+alpha)*deltax ) ) ;
             fluxp(i) = 2*fluxf(i)/(1+alpha) - fluxm*(1-alpha)/(1+alpha);
             fluxm = fluxp(i);
             end
             
             %let equal reverse 
             
             for j=1:cells;
             fluxr(i) = (src(i)+((2*mu(m))/((1-alpha)*deltax))*fluxp)/ (sigmat(g) + (2*mu)/( (1-alpha)*deltax ) ) ;
             fluxm(i) = 2*fluxf(i)/(1+alpha) - fluxp*(1-alpha)/(1+alpha);
             flux
             end
         
       end  

%convergence junk

end
       
end
end