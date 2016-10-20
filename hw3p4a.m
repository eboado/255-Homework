L = [0:2];
theta = linspace( 0 , 2*pi );
phi = linspace( -pi/2, pi/2 );
[theta,phi] = meshgrid(theta,phi);
for i = 1:numel(L);
    if i == 0
        m = 0;
    else
        m = [-L(i):L(i)];
    end
    
    for n = 1:numel(m)

 % Manual Creation of p values
 %        if L(i)==0
 %               P=1;
 %         elseif L(i)==1
 %        if m==-1
 %           P=(cos(theta)^2-1)^1;
 %         elseif m==0
 %           P=-sin(theta);
 %         elseif m==1
 %           P=-2*cos(2*theta);
 %        end
 %         elseif L(i)==2
 %        if m==-2
 %           P=(cos(theta)^2-1)^2;
 %         elseif m==-1
 %           P=4*sin(theta)^3*cos(theta);
 %         elseif m==0
 %           P=4*sin(theta)^2*(2*cos(2*theta)+1);
 %         elseif m==1
 %           P=8*sin(4*theta)-4*sin(2*theta);
 %         elseif m==2
 %         P=-8*(cos(2*theta)-4*cos(4*theta));
 %     end
 %        end

       P = legendre(L(i),cos(theta));

       %place main function here
       if L(i) == 0
           Y = ((-1).^m(n)*sqrt(((2*L(i)+1)/(4*pi))*(factorial(L(i)-m(n))/factorial(L(i)+m(n))))*P(:,:)).^2;

       end
       if L(i) > 0

           if (n > 2) && (L(i) == 1)

               Y = ((-1).^m(n)*sqrt(((2*L(i)+1)/(4*pi))*(factorial(L(i)-m(n))/factorial(L(i)+m(n))))*squeeze(P(2,:,:))).^2;
               [x,y,z] = sph2cart(phi,theta,Y);
               figure; 
               surf(x,y,z)
               hold on
               continue
           end
           if (n == 4 )
              Y = ((-1).^m(n)*sqrt(((2*L(i)+1)/(4*pi))*(factorial(L(i)-m(n))/factorial(L(i)+m(n))))*squeeze(P(2,:,:))).^2;
               [x,y,z] = sph2cart(phi,theta,Y);
               figure; 
               surf(x,y,z)
               hold on
              continue
           end
           if (n == 5 )
              Y = ((-1).^m(n)*sqrt(((2*L(i)+1)/(4*pi))*(factorial(L(i)-m(n))/factorial(L(i)+m(n))))*squeeze(P(1,:,:))).^2;
                [x,y,z] = sph2cart(phi,theta,Y);
                figure; 
                surf(x,y,z)
                hold on
              continue
           end
           Y = ((-1).^m(n)*sqrt(((2*L(i)+1)/(4*pi))*(factorial(L(i)-m(n))/factorial(L(i)+m(n))))*squeeze(P(n,:,:))).^2;
       end
       [x,y,z] = sph2cart(phi,theta,Y);
       figure; 
       surf(x,y,z)
       hold on
    end
    
end
