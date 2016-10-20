L = [0:2];
theta = linspace( 0 , 2*pi );
phi = linspace( -pi/2, pi/2 );
[theta,phi] = meshgrid(theta,phi);

k=1;
q=1;
index=1;
qlm=zeros(6,1);
slm=zeros(3,1);
qeg = zeros(100,100);
ylm1=zeros(100,100);
ylm2=zeros(100,100);
ylm3=zeros(100,100);
ylm4=zeros(100,100);
ylm5=zeros(100,100);
ylm6=zeros(100,100);
ylm7=zeros(100,100);
ylm8=zeros(100,100);
ylm9=zeros(100,100);

for i = 1:numel(L);
    if i == 0
        m = 0;
    else
        m = [-L(i):L(i)];
    end
    
    for n = 1:numel(m)

% % Manual Creation of p values
% %        if L(i)==0
% %               P=1;
% %         elseif L(i)==1
% %        if m==-1
% %           P=(cos(theta)^2-1)^1;
% %         elseif m==0
% %           P=-sin(theta);
% %         elseif m==1
% %           P=-2*cos(2*theta);
% %        end
% %         elseif L(i)==2
% %        if m==-2
% %           P=(cos(theta)^2-1)^2;
% %         elseif m==-1
% %           P=4*sin(theta)^3*cos(theta);
% %         elseif m==0
% %           P=4*sin(theta)^2*(2*cos(2*theta)+1);
% %         elseif m==1
% %           P=8*sin(4*theta)-4*sin(2*theta);
% %         elseif m==2
% %         P=-8*(cos(2*theta)-4*cos(4*theta));
% %     end
% %     end

       P = legendre(L(i),cos(theta));
       if L(i) == 0
           Ymn = ((-1).^m(n)*sqrt(((2*L(i)+1)/(4*pi))*(factorial(L(i)-m(n))/factorial(L(i)+m(n))))*P(:,:)).^2;

       end
       if L(i) > 0

           if (n > 2) && (L(i) == 1)

               Ymn = ((-1).^m(n)*sqrt(((2*L(i)+1)/(4*pi))*(factorial(L(i)-m(n))/factorial(L(i)+m(n))))*squeeze(P(2,:,:))).^2;
                if index==1
                        ylm1=Ymn;
                    elseif index==2
                        ylm2=Ymn;
                    elseif index==3
                        ylm3=Ymn;
                    elseif index==4
                        ylm4=Ymn;
                    elseif index==5
                        ylm5=Ymn;
                    elseif index==6
                        ylm6=Ymn;
                    elseif index==7
                        ylm7=Ymn;
                    elseif index==8
                        ylm8=Ymn;
                    elseif index==9
                        ylm9=Ymn;
                end
                    index=index+1;
               continue
           end
           if (n == 4 )
              Ymn = ((-1).^m(n)*sqrt(((2*L(i)+1)/(4*pi))*(factorial(L(i)-m(n))/factorial(L(i)+m(n))))*squeeze(P(2,:,:))).^2;
                if index==1
                        ylm1=Ymn;
                    elseif index==2
                        ylm2=Ymn;
                    elseif index==3
                        ylm3=Ymn;
                    elseif index==4
                        ylm4=Ymn;
                    elseif index==5
                        ylm5=Ymn;
                    elseif index==6
                        ylm6=Ymn;
                    elseif index==7
                        ylm7=Ymn;
                    elseif index==8
                        ylm8=Ymn;
                    elseif index==9
                        ylm9=Ymn;
                end
                    index=index+1;
              continue
           end
           if (n == 5 )
              Ymn = ((-1).^m(n)*sqrt(((2*L(i)+1)/(4*pi))*(factorial(L(i)-m(n))/factorial(L(i)+m(n))))*squeeze(P(1,:,:))).^2;
                  if index==1
                        ylm1=Ymn;
                    elseif index==2
                        ylm2=Ymn;
                    elseif index==3
                        ylm3=Ymn;
                    elseif index==4
                        ylm4=Ymn;
                    elseif index==5
                        ylm5=Ymn;
                    elseif index==6
                        ylm6=Ymn;
                    elseif index==7
                        ylm7=Ymn;
                    elseif index==8
                        ylm8=Ymn;
                    elseif index==9
                        ylm9=Ymn;
                  end
                    index=index+1;
              continue
           end
           Ymn = ((-1).^m(n)*sqrt(((2*L(i)+1)/(4*pi))*(factorial(L(i)-m(n))/factorial(L(i)+m(n))))*squeeze(P(n,:,:))).^2;
       end
           
    if index==1
            ylm1=Ymn;
        elseif index==2
            ylm2=Ymn;
        elseif index==3
            ylm3=Ymn;
        elseif index==4
            ylm4=Ymn;
        elseif index==5
            ylm5=Ymn;
        elseif index==6
            ylm6=Ymn;
        elseif index==7
            ylm7=Ymn;
        elseif index==8
            ylm8=Ymn;
        elseif index==9
            ylm9=Ymn;
    end
    index=index+1;
    if mod(L(i),2)==0
            qlm(k) = qlm(k)+sum(sum(abs(Ymn).^2));
            k=k+1;
    elseif mod(L(i),2)~=0
            slm(q) = qlm(k)+sum(sum(abs(Ymn).^2));
            q=q+1;
    end  
           [x,y,z] = sph2cart(phi,theta,Ymn);
    end
end 
    
for index=1:9
    if index==1
        qeg=qeg+qlm(1)*ylm1;
    elseif index==2
        qeg=qeg+slm(1)*ylm2;
    elseif index==3
        qeg=qeg+slm(2)*ylm3;
    elseif index==4
        qeg=qeg+slm(3)*ylm4;
    elseif index==5
        qeg=qeg+qlm(2)*ylm5;
    elseif index==6
        qeg=qeg+qlm(3)*ylm6;
    elseif index==7
        qeg=qeg+qlm(4)*ylm7;
    elseif index==8
        qeg=qeg+qlm(5)*ylm8;
    elseif index==9
        qeg=qeg+qlm(6)*ylm9;
    end
end