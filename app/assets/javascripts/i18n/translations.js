I18n.defaultLocale = "pt-BR";
I18n.locale = "pt-BR";
I18n.currentLocale();

I18n.translations["pt-BR"] = {
  page:{
    links:{
      delete: "Excluir %{model}"
    }
  },
  messages:{
    success: {
      create: " %{model} criado com sucesso !",
      destroy: " %{model} excluído com sucesso!",
      update: " %{model} atualizado com sucesso !"
    },
    error:{
      create: "Não foi possível criar %{model}",
      update: "Não foi possível atualizar %{model}",
      destroy: "Não foi possível excluir %{model}"
    }
  }
}
