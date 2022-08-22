const STORAGE_KEY = "githubPersonnalAccessToken";

const query = `
{
  repository(owner: "dojo-developpement-paris", name: "dojo-developpement-paris.github.io") {
    url
    refs(refPrefix: "refs/heads/", first: 10, orderBy: {field: ALPHABETICAL, direction: DESC}) {
      nodes {
        name
      }
    }
  }
}
`;

const dojoBranch = /^\d{4}-\d{2}-\d{2}$/;

function tokenSeemsValid(token) {
  return token !== null && /^\w+$/.test(token);
}

function getToken() {
  let token = window.localStorage.getItem(STORAGE_KEY);

  if (tokenSeemsValid(token) === false) {
    window.alert(
      "Vous allez être rediriger vers l'interface de GitHub\nVeuillez générez un token sans authorisation particulière"
    );

    window.open("https://github.com/settings/tokens/new");

    token = window.prompt("Token");
    if (tokenSeemsValid(token) === true) {
      window.localStorage.setItem(STORAGE_KEY, token);
    }
  }

  return token;
}

function deleteToken() {
  window.localStorage.removeItem(STORAGE_KEY);
}

async function getResult(token) {
  const response = await fetch("https://api.github.com/graphql", {
    method: "POST",
    body: JSON.stringify({ query }),
    headers: {
      Authorization: `bearer ${token}`
    }
  });

  return response.json();
}

function getLastBranchName(repository) {
  const branchesName = repository.refs.nodes
    .map(node => node.name)
    .filter(name => dojoBranch.test(name));
  return branchesName[0];
}

function formatURL(repositoryURL, branchName) {
  return `${repositoryURL}/tree/${branchName}`;
}

async function redirectToLastBranch() {
  try {
    const token = getToken();
    const result = await getResult(token);
    const { repository } = result.data;
    const branchName = getLastBranchName(repository);
    const url = formatURL(repository.url, branchName);
    window.location.assign(url);
  } catch (ex) {
    console.error(ex);
    if (
      window.confirm(
        "Oups ! Problème technique\nPlus d'infos dans la console\nVoulez vous supprimer le token ?"
      )
    ) {
      deleteToken();
    }
  }
}
