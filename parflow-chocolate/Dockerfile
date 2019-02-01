FROM parflow-vanilla:latest

ADD ./installer.sh .
RUN sudo chown docker:docker installer.sh
RUN chmod +x installer.sh && ./installer.sh
RUN echo 'export OMPI_MCA_btl="^vader"' >> ~/.bashrc

CMD ["bash"]

